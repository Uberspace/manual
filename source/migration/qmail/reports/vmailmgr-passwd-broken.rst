.. _vmailmgr-passwd-broken:

The mail database file ~/passwd.cdb seems to be broken
======================================================

``id:vamilmgr-passwd-broken``

The data for the mailusers in the standard mail system are stored in the file ``~/passwd.cdb`` but we are unable to
parse data from the file despite the file exists and contains some data. This can be due to broken entries.

You can check with the following command, if you see any entries with special chars:

.. code-block:: console

   [isabell@stardust ~]$ listvdomain
   mailuser Yes hallo@example.com

If you can already identify any problems there, you could try removing the correspoding mail users (as long as its not
in use or you can restore it easily).

Of course you can contact our `support <https://uberspace.de/support/>`_ if you need help here.

.. include:: ../includes/levels/fatal.rst