.. _content-path-folder-fits-and-vmailmgr-user-not-exists:

The file contains a path to the maildir of a non existing mail user
===================================================================

``id:content-path-folder-fits-and-vmailmgr-user-not-exists``

This error indicates that the qmail file redirects mails to a maildir path but there is no mailuser configured for this
address.

Because this should currently not work and incoming mails are just bounced back you are save to remove the qmail file
so mails are correctly rejected in the first place.

.. include:: ../includes/levels/warning.rst