.. _content-code:

The file contains a code pipe "|" to a custom command
=====================================================

``id:content-code``

This error indicates, that you are redirecting mails directly to programming scripts. This is not supported in the
standard mailsetup and you will need to find another way to automatically process your incoming mails.

The most common tools to workaround this could be ``fetchmail`` oder ``getmail`` which you can use to collect mails
from a mailbox and then process them with your code. You could also configure your code to fetch the mails directly
from the mailbox.

.. include:: ../includes/levels/fatal.rst