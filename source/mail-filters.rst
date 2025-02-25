#####################
Mail filter and rules
#####################

You can filter your incoming mails with `Sieve <http://www.ietf.org/rfc/rfc3028.txt>`_. Sieve scripts can be used to automatically delete or forward messages, to send autoreplies, to sort emails into folders as they arrive, to mark messages as read or flagged or to reject messages at or after delivery.

A Sieve script consists of a number of conditions which are applied to incoming mail; if an email matches a test, then the actions associated with that test are performed.

.. warning:: The :doc:`spamfolder <mail-spam>` needs to be enabled to use Sieve filtering.

ManageSieve
###########

To create and manage scripts, you can use any tool speaking the *ManageSieve protocol*. Many E-Mail clients support the protocol, you can find a list of tools and plugins at `sieve.info <http://sieve.info/clients>`_. You can edit your scripts in the :doc:`webmailer <mail-access>`.

.. tip:: We recommend the `Sieve Script Editor <https://github.com/thsmi/sieve>`_ which has a GUI to drag and drop the rules and is available for many platforms and apps.

Access
======

If you need to provide access data you can use the following:

+--------------------+-------------------------------------------------------+
|Server              | your :term:`Hostname`  (``<something>.uberspace.de``) |
+--------------------+-------------------------------------------------------+
|Port                | ``4190``                                              |
+--------------------+-------------------------------------------------------+
|Username            | Your email address, including the domain              |
+--------------------+-------------------------------------------------------+
|Password            | Your password for the email address                   |
+--------------------+-------------------------------------------------------+

Scripts
#######

You can store as many Sieve scripts as you like but only one can be active at a time. There's a `good Sieve reference <https://thsmi.github.io/sieve-reference/en/>`_ online which describes the components which make up a script.


Examples
========


Sort mails into folder
----------------------

In this example we sort mails from a mailinglist into a folder, sort mails to ``*@allcolorsarebeautiful.example`` into another folder and lower the maximum spam score to 4.

.. code-block:: cfg

    require ["fileinto", "reject", "relational", "comparator-i;ascii-numeric"];

    # Mails with a spam score greater than 4 are probably SPAM, sort them and stop
    if allof (
      not header :matches "X-Rspamd-Score" "-*",
      header :value "ge" :comparator "i;ascii-numeric" "X-Rspamd-Score" "4")
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

    # Forward all incoming mails to multiple recipients
    redirect "recipient1@example.com";
    redirect "recipient2@example.com";

    # The command "keep" is executed automatically, if no other action is taken.

.. tip:: ``stop;`` tells the Sieve engine to stop here, without checking for more rules.

Vacation auto reply
-------------------

.. code-block:: cfg

    require ["variables", "vacation"];
    
    if header :matches "Subject" "*" {
      set "subjwas" "${1}";
    }
    
    vacation

      # Reply at most once a week to a same sender
      :days 7
      :subject "Out of office ${subjwas}"
    "I'm not in the office from 20 May until 31 May.

    Best regards
    Jane Doe";
    # The command "keep" is executed automatically, if no other action is taken.

Send notification about new mails to another mail address
---------------------------------------------------------

.. code-block:: cfg

    require ["enotify", "variables"];

    # Set notification address
    set "notify_address" "mailto:notfyme@example.com";

    # Set from address for notification
    set "notify_from" "mailnotifier@example.com";

    # Store From and Subject in variables
    if address :matches "from" "*" {
        set "from_address" "${1}";
    }
    if header :matches "subject" "*" {
        set "subject" "${1}";
    }
    
    # Send notification mail
    notify :from "${notify_from}" :message "New mail received from: ${from_address} Subject: ${subject}" "${notify_address}";

You can find many more examples in the `Dovecot Wiki <https://doc.dovecot.org/configuration_manual/sieve/examples/>`_.

Troubleshooting
===============

Logging
-------

If something does not work check the log at ``~/users/$MAILBOX/.dovecot.sieve.log``. However, this log is only written if Sieve itself encounters an error. If it does not exist, your script was executed successfully.

Debugging tools
---------------

You can use the ``sieve-test`` command-line utility to test your Sieve filter script and see which options would be performed:

.. code-block:: console

  [isabell@stardust ~]$ SENDER_ADDRESS=mail@example.com # replace mail@example.com with the sender address to test
  [isabell@stardust ~]$ TEST_MAILBOX=isa # replace isa with the name of the mailbox to test
  [isabell@stardust ~]$ EMAIL_FILE=/home/isabell/testmail.eml # replace the path with the path to the mail file you want to test
  [isabell@stardust ~]$ sieve-test -D -t - -Tlevel=matching -a $SENDER_ADDRESS -l $HOME/users/$TEST_MAILBOX $HOME/users/$TEST_MAILBOX/.dovecot.sieve $EMAIL_FILE

You can also use `Fastmail's Sieve Tester <https://app.fastmail.com/sievetester>`_ to test the syntax of scripts and checks what actions a script causes to the provided email message.

Mailaddress with dots
---------------------

.. warning:: In some cases Sieve may not work with mail addresses with a dot in the local part like ``my.address@example.com``.

Existing maildirs with a dot in the local part have a path like ``~/users/my:address`` but Sieve expects a double colon like ``~/users/my::address``. The simple workaround for existing maildirs is to set a symlink:

.. code-block:: console

  [isabell@stardust ~/users]$ ln -s my\:address my\:\:address

Sieve will then store and read the scripts from the linked folder. For newly created mailboxes, this problem is already fixed and you dont need a workaround.

System mailbox
--------------

The :doc:`system mailbox <mail-mailboxes>` created under ``~/Maildir`` allows to set up Sieve filters, but they are never executed.

To use Sieve filters you need to :doc:`create a regular mailbox <mail-mailboxes>` and enable the :doc:`spamfolder <mail-spam>`.

Background
##########

Sieve scripts are stored in the corresponding mailbox folder ``~/users/$MAILBOX/sieve/``. The active script is symlinked from ``~/users/$MAILBOX/.dovecot.sieve``:

.. code-block:: console

  [isabell@stardust ~/users/anna]$ readlink -f .dovecot.sieve
  /home/isabell/users/anna/sieve/test.sieve

Dovecot will compile a ``~/users/$MAILBOX/.dovecot.svbin`` from this script for the first mail delivered to the mailbox. It will also recompile for each new mail if the symlink or the script has been changed and the timestamp is updated. You can also trigger this by using ``sievec /path/to/script.sieve`` and check if it compiles correctly.

.. tip:: When using ManageSieve the scripts are compiled and validated *before* they are uploaded and installed by symlinking. This can prevent you from inadvertently installing a broken Sieve script.
