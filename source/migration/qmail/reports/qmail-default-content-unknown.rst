.. _qmail-default-content-unknown:

The content of the main qmail file ~/.qmail-default is configured with unknown content
======================================================================================

``id:qmail-default-content-unkown``

The file ``~/.qmail-default`` is the only qmail file neccessary for the standard mail setup on U7.

If the file is configured with any custom content, the standard mail setup most probably wont work. You need to check
the file content and find a way to workaround the current configuration with the standard mail setup.

To restore the the standard mail setup you need to remove the current file and then recreate it:

.. code-block:: console

  [isabell@stardust ~]$ rm ~/.qmail-default
  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

.. include:: ../includes/levels/mailsetup_error.rst