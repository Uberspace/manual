.. _content-multiline-contains-multiple-non-mailaddr:

The file contains multiple lines which are no mailaddresses
===========================================================

``id:content-multiline-contains-multiple-non-mailaddr``

This error indicates that you have a qmail configuration file with multiple custom lines. For the standard mail system,
we can only set up forwards to multiple mailaddresses with or without a mailbox.

Any other configurations, like redirecting mails to multiple maildirs etc. cannot be adapted. You need to check the
content of the qmail file and decide how you want to set this up manually.

To do so run ``cat ~/.qmail-example`` with the proper path. Any comment lines starting with ``#`` are ignored for this
check.

.. include:: ../includes/levels/fatal.rst