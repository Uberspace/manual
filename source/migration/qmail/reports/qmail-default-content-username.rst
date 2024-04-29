.. _qmail-default-content-username:

The content of the main qmail file ~/.qmail-default is the username
====================================================================

``id:qmail-default-content-username``

The file ``~/.qmail-default`` is the only qmail file neccessary for the standard mail setup on U7.

When the file is setup with the username, this will forward all incoming mails to **username@uber.space** and bypasses
the standard mail system without filtering spam. You can use instead a real catchall with a mailbox.

First you need to remove the current file and restore the standard mail setup:

.. code-block:: console

  [isabell@stardust ~]$ rm ~/.qmail-default
  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

Then lookup the manual how to create a `catchall <https://manual.uberspace.de/mail-mailboxes/#catch-all-mailbox>`_.

.. include:: ../includes/levels/mailsetup_error.rst