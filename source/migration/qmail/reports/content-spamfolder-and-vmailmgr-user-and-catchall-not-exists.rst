.. _content-spamfolder-and-vmailmgr-user-and-catchall-not-exists:

The file forwards to a non existing mail user "example" and there is no catchall configured
===========================================================================================

``id:content-spamfolder-and-vmailmgr-user-and-catchall-not-exists``

This error indicates that the qmail file redirects mails to the mail system (with
``|maildrop /home/username/.spamfolder``) but there is no mailuser or catchall configured for this address.

Because this should currently not work and incoming mails are just bounced back you are save to remove the qmail file
so mails are correctly rejected in the first place.

.. include:: ../includes/levels/warning.rst