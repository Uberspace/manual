.. _dotnet:

.. sidebar:: Logo
  
  .. image:: _static/images/logo_dotnet.png 
      :align: center

#########
.NET Core
#########

Introduction
============

.. warning:: .NET scripts belong in your :ref:`home`, **not** in your :ref:`docroot`.

`.NET <https://www.microsoft.com/net>`_ is a server-side runtime implementation of CLR, the virtual machine that manages the execution of .NET programs. While .NET Core shares a subset of .NET Framework APIs, it comes with its own API that is not part of .NET Framework.

----

Versions
========

Release types 
-------------

We provide .NET Core 2.0 and apply security updates on a regular basis. 

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://www.microsoft.com/net/support/policy>`_ ends, the branch reaches its end of life, is no longer supported and will be removed from our servers. 

+--------+-------------------------+------------------+ 
| Branch | State                   | Supported Until  | 
+========+=========================+==================+ 
| 2      | Current release         | August 2020      | 
+--------+-------------------------+------------------+ 

----

Getting started
===============

Check out the `Hello, Console App! <https://docs.microsoft.com/en-us/dotnet/core/tutorials/using-with-xplat-cli>`_.

----

Connection to webserver
=======================

In order to make your .NET application accessable from the outside, you need to connect it to the webserver. This is done using a proxy ``RewriteRule`` to forward requests to the application's network port. For example, if your application is listening on port 61625 and you want it to be accessable at ``https://<user>.uber.space/dotnet/``, place an :ref:`.htaccess <htaccess>` file looking like this in your :ref:`docroot`:

.. code-block:: apacheconf

  RewriteEngine On
  RewriteRule ^dotnet/(.*) http://localhost:61625/$1 [P]

.. include:: includes/htaccess-directoryindex.txt

----

Caveats
=======

Privacy
-------

.NET collects `telemetry data <https://docs.microsoft.com/en-us/dotnet/core/tools/telemetry>`_ by default. This can be turned off by setting the environment variable ``DOTNET_CLI_TELEMETRY_OPTOUT`` to ``1``. 
