.. _backends:

############
web backends
############

Using web backends you can connect your applications directly to our frontend to make them accessible from the outside. Traffic is proxied transparently to your application: WebSockets just work and the ``Host`` header is set correctly. If you have prior experience with ``RewriteRule`` proxies, you can also expect backends to be much faster.

.. tip:: The application needs to listen on interface ``::`` or ``0.0.0.0`` (using ``127.0.0.1``, ``localhost`` or ``::1`` does **not** work!) at any port between 1024 and 65535.

.. warning:: If you make use of WebSockets, make sure to send `keep alive`_ packages every few minutes. Idle HTTP connections are shut down after three minutes.

In the background, every Uberspace account gets its own virtual network interface. That enables you to use any port you like. Check out the :ref:`background article <network>` for details.  

Setup
=====

In order to use your own backend, you first need to set it up using the ``uberspace`` tool. We don't limit the number of web backends.

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend 
  
  Manage backends in web server configuration.
  
  Possible commands:
    del — Delete web backend for a given domain and path.
    list — List all configured web backends.
    set — Set web backend for a given domain and path.

    [isabell@philae ~]$ 

default backend
===============

In the default configuration the default backend is :ref:`Apache <docroot>`:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set / --apache
  Set backend for / to apache.
  
  [isabell@philae ~]$ uberspace web backend list
  / apache (default)

  [isabell@philae ~]$ 

To set the default backend to an application listening on port 1024 (for example your own nginx webserver) run 

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set / --http --port 1024   
  Set backend for / to port 1024; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".

  [isabell@philae ~]$ uberspace web backend list
  / http:1024 => OK, listening: PID 42, nginx

  [isabell@philae ~]$ 

specific path
-------------

In this example requests to ``/ep`` are routed to an application listening on port 9000, everything else is handled by apache:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set /ep --http --port 9000
  Set backend for /ep to port 9000; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".

  [isabell@philae ~]$ uberspace web backend list
  /ep http:9000 => OK, listening: PID 42, node-red
  / apache
  
  [isabell@philae ~]$ 

Some applications don't serve assets due to performance reasons. In this example ``/assets`` is served via apache, everything else is routed to the application listening on port 9000:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set / --http --port 9000
  Set backend for / to port 9000; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".

  [isabell@philae ~]$ uberspace web backend set /assets --apache
  Set backend for /assets to apache

  [isabell@philae ~]$ uberspace web backend list
  /assets apache
  / http:9000 => OK, listening: PID 42, node-red


specific domain
---------------

You also can setup backends for specific domains. Make sure :ref:`your domain <web-domains>` is setup and configured correctly. 

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.example --http --port 9000
  Set backend for allcolorsarebeautiful.example/ to port 9000; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".

  [isabell@philae ~]$ uberspace web backend list                                                      
  allcolorsarebeautiful.example/ http:9000 => OK, listening: PID 42, node-red
  / apache (default)

  [isabell@philae ~]$
  
mix and match
-------------

Of course you can combine specific paths and domains. This is a more advanced example:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.example/ep/assets --apache
  Set backend for allcolorsarebeautiful.example/ep/assets to apache
  
  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.example/ep --http --port 9000
  Set backend for allcolorsarebeautiful.example/ep to port 9000; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".

  [isabell@philae ~]$ uberspace web backend set / --http --port 1024
  Set backend for / to port 1024, make sure something is listening.

  [isabell@philae ~]$ uberspace web backend list
  allcolorsarebeautiful.example/ep/assets apache
  allcolorsarebeautiful.example/ep http:9000 => OK, listening: PID 23, node-red
  / http:1024 => OK, listening: PID 42, nginx
  
  [isabell@philae ~]$ 

The content for /ep/assets in this example must be placed as described under :ref:`DocumentRoot <docroot>`:. 
The longest matched path for a domain wins so you don't need to worry about the order of the backends.

prefix handling
---------------

By default, the whole path (e.g. ``/ep/assets/style.css``) is passed onto the backend. Some applications
require that only the part after their prefix (``/assets/style.css`` in this case) reaches them. To enable
this behavior, add ``--remove-prefix``:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend set allcolorsarebeautiful.example/ep --http --port 9000 --remove-prefix
  Set backend for allcolorsarebeautiful.example/ep to port 9000; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".

  [isabell@philae ~]$ uberspace web backend list
  allcolorsarebeautiful.example/ep http:9000, --remove-prefix => OK, listening: PID 23, node-red
  / apache

  [isabell@philae ~]$

Removal
=======

You can remove web backends with ``uberspace web backend del``:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend list
  allcolorsarebeautiful.example/ http:9000 => OK, listening: PID 42, node-red
  / http:9001 => OK, listening: PID 12611, nc -6 -l :: 9001

  [isabell@philae ~]$ uberspace web backend del allcolorsarebeautiful.example
  The web backend has been deleted.

  [isabell@philae ~]$ uberspace web backend del /
  The web backend has been deleted.

  [isabell@philae ~]$ uberspace web backend list
  / apache (default)

Debugging
=========

``uberspace web backend list`` provides information for all your debugging needs. In this example we have three applications, two backends are not working. Let's find out why:

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend list
  /doesnotwork http:8000 => NOT OK, wrong interface (::1): PID 17767, nc -l localhost 8000
  /worksforme http:9000 => OK, listening: PID 12295, nc -l 0.0.0.0 9000
  /notrunning http:1024 => NOT OK, no service
  / apache (default)

  [isabell@philae ~]$ 

The solution for ``/doesnotwork`` is to change the listening interface to ``::``. The service for ``/notrunning`` is not running or the port is incorrect. Check the configuration and restart the service.

.. code-block:: console

  [isabell@philae ~]$ uberspace web backend list
  /doesnotwork http:8000 => OK, listening: PID 17767, nc -l :: 8000
  /worksforme http:9000 => OK, listening: PID 12295, nc -l 0.0.0.0 9000
  /notrunning http:1024 => OK, listening: PID 24213, nginx
  / apache (default)

  [isabell@philae ~]$ 


.. _`keep alive`: https://en.wikipedia.org/wiki/Keepalive
