.. _content-path-file:

The file contains a path to a custom mailbox-file
=================================================

``id:content-path-file``

This error incidates that the qmail file is configured with a path to a mailbox file and thus bypasses the mailsetup.

You will need to create a real mailbox with ``uberspace mail user add ...`` and import your mails from the mailbox
file if you want to keep them in the standard mail system.

.. include:: ../includes/levels/error.rst