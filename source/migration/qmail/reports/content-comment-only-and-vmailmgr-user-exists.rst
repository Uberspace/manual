.. _content-comment-only-and-vmailmgr-user-exists:

The file conflicts with an already existing mail user
=====================================================

``id:content-comment-only-and-vmailmgr-user-exists``

This error indicates, that you have a qmail file like ``.qmail-mailbox`` but likewise a mail user ``mailbox``. The qmail
file drops all incoming mails while the mailuser cannot receive the those mails.

You need to fix these conflicting configurations, however the qmail file should be removed to use the standard mail
system only.

.. include:: ../includes/levels/error.rst