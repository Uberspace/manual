.. _supervisord:

###########
supervisord
###########

We use ``supervisord`` to monitor services. A service, or daemon, is a program that starts automatically and is kept in the background. In case it quits or crashes, it is restarted by ``supervisord``.

Create a Service
================

To create a new service, place a ``.ini`` file for each new service in ``~/etc/services.d/``. So if you want to add a service called my-daemon that runs an executable located at ``/home/isabell/bin/my-daemon``, place the file ``my-daemon.ini`` in ``~/etc/services.d/`` and edit it:

.. code-block:: ini

 [program:my-daemon]
 command=/home/isabell/bin/my-daemon
 startsecs=60

Afterwards, ask ``supervisord`` to look for new ``.ini`` files:

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl reread
 my-daemon: available

And then start your daemon:

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl update
 my-daemon: added process group

Start / Stop a Service
======================

To start a non-running service or stop a running one, use ``supervisorctl start my-daemon`` and ``supervisorctl stop my-daemon``. To restart a service, you can also use ``supervisorctl restart my-daemon``.

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl start my-daemon
 my-daemon: started
 [isabell@stardust ~]$ supervisorctl stop my-daemon
 my-daemon: stopped
 [isabell@stardust ~]$ supervisorctl restart my-daemon
 my-daemon: stopped
 my-daemon: started


Remove a Service
================

To remove a service, you need to stop it first, then you can remove it using ``supervisorctl``:

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl stop my-daemon
 my-daemon: stopped
 [isabell@stardust ~]$ supervisorctl remove my-daemon
 my-daemon: removed process group

List Services
=============

To get an overview of your services and their current status, run ``supervisorctl status``:

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl status
 my-daemon                              RUNNING   pid 16337, uptime 0:00:04

Logging
=======

``supervisord`` logs are stored in ``~/logs/``. You can use ``supervisorctl tail my-daemon`` and ``supervisorctl tail my-daemon stderr`` to view the log for ``my-daemon``. Type in ``supervisorctl tail`` to see available options.

Further Reading
===============

* Check the global config if you’re curious: ``/etc/supervisord.conf``.
* Check out the `official supervisord documentation <http://supervisord.org/>`_.
