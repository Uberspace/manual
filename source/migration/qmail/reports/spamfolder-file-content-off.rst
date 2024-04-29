.. _spamfolder-file-content-off:

The script file ~/.spamfolder for the standard mail setup contains unkown content
=================================================================================

``id:spamfolder-file-content-off``

The spamfolder script process all incoming mail and enables features like Sieve and ``+``-subaddressing.

With a custom script we cannot process mails in the standard way. If you have set up any custom scripts to process your
mails you will need to find workarounds with the standard mail setup, like with Sieve scripts etc.

To restore the standard mail processing with the default spamfolder script, first remove the custom script and run
the spamfolder enable comand.

.. code-block:: console

  [isabell@stardust ~]$ rm ~/.spamfolder
  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

.. include:: ../includes/levels/error.rst