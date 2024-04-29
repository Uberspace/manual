.. _content-empty:

The file content is empty
=========================

``id:content-empty``

The error indicates, that the file contains an empty qmail configuration. This will store incoming mails directly to the
maildir ``~/Maildir`` and so bypasses the mail setup. In the standard mail system we can only support full mailaddresses
as forwards.

You need to check in what way you want to use this mailaddress and the forward target, you should set up either a real
forward to a mailaddress or a mailbox for this mail.

.. include:: ../includes/levels/error.rst