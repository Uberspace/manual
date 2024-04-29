.. _qmail-default-not-exists:

The main qmail file ~/.qmail-default does not exist
===================================================

``id:qmail-default-not-exists``

The file ``~/.qmail-default`` is the only qmail file neccessary for the standard mail setup on U7.

To be able to use the standard mail setup you need to recreate the file with the command:

.. code-block:: console

  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

.. include:: ../includes/levels/mailsetup_error.rst


