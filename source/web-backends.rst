.. _backends:

############
web backends
############

.. tip:: The application needs to listen on interface ``::`` or ``0.0.0.0`` (using ``127.0.0.1``, ``localhost`` or ``::1`` does **not** work!) at any port between 1024 and 65535. 

You can connect your applications directly to our frontend to make them accessible from the outside. We don't limit the number of web backends.

.. sidebar:: advantages

  Using web backends has several advantages over a proxy RewriteRule: WebSockets work, no X-Forwarded-Host header and it's **much** faster.

Every Uberspace account gets its own virtual network interface, check out the :ref:`background article <network>` for details.  

Setup
=====

default backend
---------------

In order to use your own backend, you first need to set it up using the ``uberspace`` tool. 

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend 
  
  Manage web backends in web server configuration.
  
  Possible commands:
    del — Delete web backed for a given domain and path.
    list — List all configured web backeds.
    set — Set web backed for a given domain and path.

    [isabell@philae ~]$ 

In the default configuration the default backend is :ref:`apache <docroot>`:

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend set / --apache
  Set backend for / to apache.
  
  [isabell@philae ~]$ uberspace web backend list
  / apache (default)

  [isabell@philae ~]$ 

To set the default backend to an application listening on port 1024 (for example your own nginx webserver) run 

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend set / --http --port 1024   
  Set backend for / to port 1024, make sure something is listening.
  
  [isabell@philae ~]$ uberspace web backend list
  / http:1024 => OK, listening: PID 42, nginx

  [isabell@philae ~]$ 

specific path
-------------

In this example requests to ``/ep`` are routed to an application listening on port 9000, everything else is handled by apache:

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend set /ep --http --port 9000
  Set backend for /ep to port 9000, make sure something is listening.

  [isabell@philae ~]$ uberspace web backend list
  /ep http:9000 => OK, listening: PID 42, node-red
  / apache
  
  [isabell@philae ~]$ 

Some applications don't serve assets due to performance reasons. In this example ``/assets`` is served via apache, everything else is routed to the application listening on port 9000:

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend set / --http --port 9000
  Set backend for / to port 9000, make sure something is listening.

  [isabell@philae ~]$ uberspace web backend set /assets --apache
  Set backend for /assets to apache

  [isabell@philae ~]$ uberspace web backend list
  /assets apache
  / http:9000 => OK, listening: PID 42, node-red


specific domain
---------------

You also can setup backends for specific domains. Make sure :ref:`your domain <web-domains>` is setup and configured correctly. 

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.de --http --port 9000
  Set backend for allcolorsarebeautiful.de/ to port 9000, make sure something is listening.

  [isabell@philae ~]$ uberspace web backend list                                                      
  allcolorsarebeautiful.de/ http:9000 => OK, listening: PID 42, node-red
  / apache (default)

  [isabell@philae ~]$
  
mix and match
-------------

Of course you can combine specific paths and domains. This is a more advanced example:

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.de/ep/assets --apache
  Set backend for allcolorsarebeautiful.de/ep/assets to apache
  
  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.de/ep --http --port 9000
  Set backend for allcolorsarebeautiful.de/ep to port 9000, make sure something is listening.
  
  [isabell@philae ~]$ uberspace web backend set / --http --port 1024
  Set backend for / to port 1024, make sure something is listening.

  [isabell@philae ~]$ uberspace web backend list
  allcolorsarebeautiful.de/ep/assets apache
  allcolorsarebeautiful.de/ep http:9000 => OK, listening: PID 23, node-red
  / http:1024 => OK, listening: PID 42, nginx
  
  [isabell@philae ~]$ 

The longest matched path for a domain wins so you don't need to worry about the order of the backends.

Removal
=======

You can remove web backends with ``uberspace web backend del``:

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend list
  allcolorsarebeautiful.de/ http:9000 => OK, listening: PID 42, node-red
  / http:9001 => OK, listening: PID 12611, nc -6 -l :: 9001

  [isabell@philae ~]$ uberspace web backend del allcolorsarebeautiful.de
  The web backend has been deleted.

  [isabell@philae ~]$ uberspace web backend del /
  The web backend has been deleted.

  [isabell@philae ~]$ uberspace web backend list
  / apache (default)

Debugging
=========

``uberspace web backend list`` provides information for all your debugging needs. In this example we have three applications, two backends are not working. Let's find out why:

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend list
  /doesnotwork http:8000 => NOT OK, wrong interface (::1): PID 17767, nc -l localhost 8000
  /worksforme http:9000 => OK, listening: PID 12295, nc -l 0.0.0.0 9000
  /notrunning http:1024 => NOT OK, no service
  / apache (default)

  [isabell@philae ~]$ 

The solution for ``/doesnotwork`` is to change the listening interface to ``::``. The service for ``/notrunning`` is not running or the port is incorrect. Check the configuration and restart the service.

.. code-block:: shell

  [isabell@philae ~]$ uberspace web backend list
  /doesnotwork http:8000 => OK, listening: PID 17767, nc -l :: 8000
  /worksforme http:9000 => OK, listening: PID 12295, nc -l 0.0.0.0 9000
  /notrunning http:1024 => OK, listening: PID 24213, nginx
  / apache (default)

  [isabell@philae ~]$ 


