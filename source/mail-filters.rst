.. _mailfilters:

#####################
Mail filter and rules
#####################

You can filter your incoming mails with `Sieve <http://www.ietf.org/rfc/rfc3028.txt>`_. Sieve scripts can be used to automatically delete or forward messages, to send autoreplies, to sort emails into folders as they arrive, to mark messages as read or flagged or to reject messages at or after delivery.

A Sieve script consists of a number of conditions which are applied to incoming mail; if an email matches a test, then the actions associated with that test are performed.

.. warning:: The :ref:`spamfolder <mailfilters>` needs to be enabled to use Sieve filtering.

ManageSieve
###########

Many E-Mail clients support the ManageSieve protocol to control and manage your Sieve filtering scripts. You can find a list of tools and plugins at `sieve.info <http://sieve.info/clients>`_. We plan to implement a rule editor in our :ref:`webmailer <mail-access>` soon.

.. tip:: We recommend the `Sieve Script Editor <https://github.com/thsmi/sieve>`_ which has a GUI to drag and drop the rules and is available for many platforms.

Access
======

+--------------------+----------------------------------------------+
|Server              | :term:`your Hostname`                        |
+--------------------+----------------------------------------------+
|Port                | ``4190``                                     |
+--------------------+----------------------------------------------+
|Username            | Your email address, including the domain     |
+--------------------+----------------------------------------------+
|Password            | Your password for the email address          |
+--------------------+----------------------------------------------+

Scripts
#######

You can store as many Sieve scripts as you like but only one can be active at a time. There's a `good Sieve reference <https://thsmi.github.io/sieve-reference/en/>`_ online which describes the components which make up a script.


Examples
========


In this example we sort mails from a mailinglist into a folder, sort mails to ``*@allcolorsarebeautiful.example`` into another folder and lower the maximum spam score to 4.

.. code-block:: sieve

    require ["fileinto", "reject", "relational"];

    # Mails with a spam score greater than 4 are probably SPAM, sort them and stop
    if header :value "ge" "X-Rspamd-Score" "4"
    {
        fileinto "Spam";
        stop;
    }

    # Sort mails from mailinglist into folder mailinglist
    if address :is "from" ["mailinglist@allcolorsarebeautiful.example", "anothermailinglist@allcolorsarebeautiful.example" ]
    {
        fileinto "mailinglist";
        stop;
    }

    # Sort mails to *@allcolorsarebeautiful.example into a special folder
    if address :is :domain "to" "allcolorsarebeautiful.example"
    {
        fileinto "important";
        stop;
    }

    # The command "keep" is executed automatically, if no other action is taken.

.. tip:: ``stop;`` tells the Sieve engine to stop here, without checking for more rules.

You can find many more examples in the `Dovecot Wiki <https://doc.dovecot.org/configuration_manual/sieve/examples/>`_.

Troubleshooting
===============

If something does not work check the logs at ``~/users/$MAILBOX/.dovecot.sieve.log``. You can also use `Fastmail's Sieve Tester <https://www.fastmail.com/cgi-bin/sievetest.pl>`_ to test the syntax of scripts and checks what actions a script causes to the provided email message.


Background
##########

Sieve scripts are stored in the corresponding mailbox folder ``~/users/$MAILBOX/sieve/``. The active script is symlinked from ``~/users/$MAILBOX/.dovecot.sieve``:

.. code-block:: console

  [eliza@dolittle ~/users/anna]$ readlink -f .dovecot.sieve
  /home/utestxx1/users/anna/sieve/test.sieve

Dovecot will compile a ``~/users/$MAILBOX/.dovecot.svbin`` from this script for the first mail delivered to the mailbox. It will also recompile for each new mail if the symlink or the script has been changed and the timestamp is updated. You can also trigger this by using ``sievec /path/to/script.sieve`` and check if it compiles correctly.

.. tip:: When using ManageSieve the scripts are compiled and validated *before* they are uploaded and installed by symlinking. This can prevent you from inadvertently installing a broken Sieve script.
