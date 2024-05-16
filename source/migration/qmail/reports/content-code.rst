.. _content-code:

The file contains a code pipe "|" to a custom command
=====================================================

``id:content-code``

This error indicates, that you are redirecting mails directly to programming scripts. This is not supported in the
standard mailsetup and you will need to find another way to automatically process your incoming mails.

.. include:: ../includes/levels/fatal.rst

Workaround for custom code scripts
----------------------------------

The most common tools to workaround this could be ``fetchmail`` oder ``getmail`` which you can use to collect mails
from a mailbox and then process them with your code. You could also configure your code to fetch the mails directly
from the mailbox.

Workaround for mail filtering with ``|maildrop``
------------------------------------------------

If you used server-side mail filter scripts with ``|maildrop`` you should be able to replace them with Sieve filter
rules. Just have a look to the `filters & rules manual page <https://manual.uberspace.de/mail-filters/>`_.