###########
supervisord
###########

We use ``supervisord`` to monitor services. A service, or daemon, is a program that starts automatically and is kept in the background. In case it quits or crashes, it is restarted by ``supervisord``. 

Create a Service
================

To create a new service, place a ``.ini`` file for each new service in ``~/etc/services.d/``. So if you want to add a service called my-daemon that runs an executable located at ``~/bin/my-daemon``, place the file ``my-daemon.ini`` in ``~/etc/services.d/`` and edit it:

.. code-block:: none

 [program:my-daemon]
 command=~/bin/my-daemon

Afterwards, ask ``supervisord`` to look for new ``.ini`` files:

.. code-block:: bash

 [eliza@doolittle ~]$ supervisorctl reread
 my-daemon: available

And then start your daemon:

.. code-block:: bash

 [eliza@doolittle ~]$ supervisorctl update
 my-daemon: added process group

Start / Stop a Service
======================

To start a non-running service or stop a running one, use ``supervisorctl start my-daemon`` and ``supervisorctl stop my-daemon``. To restart a service, you can also use ``supervisorctl restart my-daemon``.

.. code-block:: bash

 [eliza@doolittle ~]$ supervisorctl start my-daemon
 my-daemon: started
 [eliza@doolittle ~]$ supervisorctl stop my-daemon
 my-daemon: stopped
 [eliza@doolittle ~]$ supervisorctl restart my-daemon
 my-daemon: stopped
 my-daemon: started


Remove a Service
================

To remove a service, you need to stop it first, then you can remove it using ``supervisorctl``:

.. code-block:: bash

 [eliza@doolittle ~]$ supervisorctl stop my-daemon
 my-daemon: stopped
 [eliza@doolittle ~]$ supervisorctl remove my-daemon
 my-daemon: removed process group

List Services
=============

To get an overview of your services and their current status, run ``supvervisorctl status``:

.. code-block:: bash

 [eliza@doolittle ~]$ supervisorctl status
 my-daemon                              RUNNING   pid 16337, uptime 0:00:04

Logging
=======

``supervisord`` logs are stored in ``~/logs/``. You can use ``supvervisorctl tail my-daemon`` to view the log for ``my-daemon``. 

Further Reading
===============

* Check the global config if you’re curious: ``/etc/supervisord.conf``.
* Check out the `official supervisord documentation <http://supervisord.org/>`_.
