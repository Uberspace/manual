.. _qmail-username-and-vmailmgr-user-blocking:

The file conflicts with an already existing mail user
=====================================================

``id:qmail-username-and-vmailmgr-user-blocking``

This error indicates, that you have a qmail file like ``.qmail-mailbox`` but likewise a mail user ``mailbox``. The qmail
file contains the username and forwards all mails to **username@uber.space** while the mailuser cannot receive the
incoming mails.

You need to fix these conflicting configurations, however the qmail file should be removed to use the standard mail
system only.

.. include:: ../includes/levels/error.rst