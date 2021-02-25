.. _mailfilters:

#####################
Mail filter and rules
#####################

Sieve is a programming language for filtering incoming emails. It is meant to be extensible, simple and independent of access protocol, mail architecture and operating system. 

A Sieve script consists of a number of tests which are applied to incoming mail; if an email matches a test, then the actions associated with that test are performed.

Sieve scripts can be used to automatically delete or forward messages; to send autoreplies; to sort emails into folders as they arrive; to mark messages as read or flagged; to test messages for spam or viruses; or to reject messages at or after delivery. 

Manage Sieve Scripts
####################

.. tip:: We plan to implement ManageSieve in our webmailer so you can build your roules there with a GUI

You can edit sieve scripts in filesystem or via ManageSieve.

.. tip:: When using ManageSieve scripts are compiled before they are installed, which guarantees that the uploaded script is valid. This can prevent you from inadvertently installing a broken Sieve script.

file system
===========

Sieve scripts are stored in the corresponding mailbox: ``~/users/$MAILBOX/Sieve``. You can have as many sieve scripts as you want but only one can be active at a time.

Enable / disable
----------------

 and have to be activated via symlink ``.dovecot.sieve -> sieve/example.sieve``

ManageSieve
===========

+--------------------+----------------------------------------------+
|Server              | :term:`your Hostname`                        |
+--------------------+----------------------------------------------+
|Port                | ``4190``                                      |
+--------------------+----------------------------------------------+
|Username            | Your email address, including the domain     |
+--------------------+----------------------------------------------+
|Password            | Your password for the email address          |
+--------------------+----------------------------------------------+

Clients
-------

http://sieve.info/clients

https://github.com/thsmi/sieve

Troubleshooting
===============

Fastmail's Sieve Tester tests the syntax of Sieve scripts and checks what actions a script causes to the provided email message.
https://www.fastmail.com/cgi-bin/sievetest.pl

Logs: ~/users/$MAILBOX/.dovecot.sieve.log

Scripts
=======

reference: https://thsmi.github.io/sieve-reference/en/




Caveats
=======

- no plus addresses atm