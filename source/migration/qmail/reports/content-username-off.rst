.. _content-username-off:

The file contains a username that is not the current user
=========================================================

``id:content-username-off``

We can only support full mailaddresses as forwards in the standard mail system. A username in a qmail file will forward
mails to ``username@host.uberspace.de`` but only on the same host. We would replace this with the default mailaddress
**username@uber.space**.

But this error indicates, that the username in the file does not fit to the current user, since this is probably a
mistake you need to check this yourself and set a full mailaddress as forward or any other configuration for this
mailaddress.

.. include:: ../includes/levels/error.rst