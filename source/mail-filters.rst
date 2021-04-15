.. _mailfilters:

#####################
Mail filter and rules
#####################

You can filter your incoming mails with `Sieve <http://www.ietf.org/rfc/rfc3028.txt>`_. Sieve scripts can be used to automatically delete or forward messages, to send autoreplies, to sort emails into folders as they arrive, to mark messages as read or flagged or to reject messages at or after delivery.

A Sieve script consists of a number of conditions which are applied to incoming mail; if an email matches a test, then the actions associated with that test are performed.

Manage Sieve Scripts
####################

Many E-Mail clients support the ManageSieve protocoll. You can find a list of tools and plugins at `sieve.info <http://sieve.info/clients>`_. We plan to implement a rule editor in our :ref:`webmailer <mail-access>` soon.

.. tip:: We recommend the `Sieve Script Editor <https://github.com/thsmi/sieve>`_ which has a GUI to drag and drop the rules and is available for many platforms.

ManageSieve
===========

+--------------------+----------------------------------------------+
|Server              | :term:`your Hostname`                        |
+--------------------+----------------------------------------------+
|Port                | ``4190``                                     |
+--------------------+----------------------------------------------+
|Username            | Your email address, including the domain     |
+--------------------+----------------------------------------------+
|Password            | Your password for the email address          |
+--------------------+----------------------------------------------+

You can store as many Sieve Scripts as you like but only one can be active at a time.

Scripts
=======

There's a `good Sieve reference <https://thsmi.github.io/sieve-reference/en/>`_ online which describes the components which make up a script.

Examples
--------


In this example we sort mails from a mailinglist into a folder, sort mails to ``*@allcolorsarebeautiful.example`` into another folder and lower the maximum spam score to 4.

.. code-block:: sieve

    require ["fileinto", "reject", "comparator-i;ascii-numeric","relational"];

    # Mails with a spam score greater than 4 are probably SPAM, sort them and stop
    if header :value "ge" :comparator "i;ascii-numeric" "X-Rspamd-Score" "4"
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

You can find many more examples in the `Dovecot Wiki <https://wiki.dovecot.org/Pigeonhole/Sieve/Examples>`_.

Troubleshooting
===============

The :ref:`spamfolder <mail-spam>` needs to be enabled to enable sieve support.

.. code-block:: console

  [eliza@dolittle ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.
  [eliza@dolittle ~]$ uberspace mail spamfolder status
  The spam folder is enabled.


If something does not work check the logs at ``~/users/$MAILBOX/.dovecot.sieve.log``. `Fastmail's Sieve Tester <https://www.fastmail.com/cgi-bin/sievetest.pl>`_ tests the syntax of scripts and checks what actions a script causes to the provided email message.

Background
==========

Sieve scripts are stored in the file system in the corresponding mailbox ``~/users/$MAILBOX/sieve/``. To enable a script, you have to create a symlink from  ``~/users/$MAILBOX/.dovecot.sieve`` to the script file:

.. code-block:: console

  [eliza@dolittle ~]$ ln -s ~/users/$MAILBOX/sieve/test.sieve ~/users/$MAILBOX/.dovecot.sieve
  [eliza@dolittle ~/users/anna]$ ls -la
  [...]
  lrwxrwxrwx.  1 eliza eliza  42  1. Apr 10:11 .dovecot.sieve -> /home/eliza/users/anna/sieve/test.sieve
  [...]

.. tip:: When using ManageSieve scripts are compiled before they are installed, which guarantees that the uploaded script is valid. This can prevent you from inadvertently installing a broken Sieve script.
