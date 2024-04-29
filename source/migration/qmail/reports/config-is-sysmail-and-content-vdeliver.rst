.. _config-is-sysmail-and-content-vdeliver:

The sysmail config file for username@uber.space contains a vdeliver code pipe
=============================================================================

``id:config-is-sysmail-and-content-vdeliver``

This error indicates that the system mail configuration file ``~/.qmail`` contains a redirect code to the mail system
(with ``|/usr/bin/vdeliver``). This does not work all incoming mails to **username@uber.space** are bounced back to the
sender.

In the standard mail system it is not possible to disable the system mail address **username@uber.space** for technical
reasons. You should remove the file ``~/.qmail`` so mails are just stored into the system mailbox.

.. include:: ../includes/levels/fatal.rst