To start a non-running service or stop a running one, use ``supervisorctl start my-daemon`` and ``supervisorctl stop my-daemon``. To restart a service, you can also use ``supervisorctl restart my-daemon``.

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl start my-daemon
 my-daemon: started
 [isabell@stardust ~]$ supervisorctl stop my-daemon
 my-daemon: stopped
 [isabell@stardust ~]$ supervisorctl restart my-daemon
 my-daemon: stopped
 my-daemon: started