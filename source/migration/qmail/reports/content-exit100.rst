.. _content-exit100:

The file contains an |exit 100 code
===================================

``id:content-exit100``

You have set up this file to bounce incoming mails. But it is better to reject mails in the first place, before making
them bounce back to the sender.

You should check if you could just remove this mailaddress from your configuration so it is properly rejected. If this
is not possble (maybe because of a catchall) you should set up a mailbox with a Sieve script to reject mails.

.. include:: ../includes/levels/error.rst