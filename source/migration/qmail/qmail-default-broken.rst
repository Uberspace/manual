The content of the main qmail file ~/.qmail-default cannot be read
==================================================================

The file ``~/.qmail-default`` is the only qmail file neccessary for the standard mail setup on U7.

To be able to use the standard mail setup you need to restore the file. First remove the broken file and then recreate
the standard file with the commands:

.. code-block:: console

  [isabell@stardust ~]$ rm ~/.qmail-default
  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

.. include:: ../includes/levels/mailsetup_error.rst