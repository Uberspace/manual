.. _content-oserror:

Retrieving the file content returned a system error
===================================================

``id:content-oserror``

This error indicates that we were not able to retrieve the content of the qmail file.

Try to check the file content by yourself, for example with ``cat ~/.qmail-example``. The file might be a symlink that
links to a non existing file.

However, most probably this qmail configuration and thus the mailaddress is currently not
working at all, then you are save to delete the file.

.. include:: ../includes/levels/error.rst