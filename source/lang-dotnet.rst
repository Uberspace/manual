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

We provide .NET Core 2.1 and apply security updates on a regular basis. 

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://www.microsoft.com/net/support/policy>`_ ends, the branch reaches its end of life, is no longer supported and will be removed from our servers. 

+--------+-------+----------------------------+ 
| Branch | State | Supported Until            | 
+========+=======+============================+ 
| 2.1    | LTS   | At least until August 2021 | 
+--------+-------+----------------------------+ 

----

Getting started
===============

Check out the `Hello, Console App! <https://docs.microsoft.com/en-us/dotnet/core/tutorials/using-with-xplat-cli>`_.

----

Connection to webserver
=======================

.. include:: includes/custom-backend.rst

----

Caveats
=======

Privacy
-------

.NET collects `telemetry data <https://docs.microsoft.com/en-us/dotnet/core/tools/telemetry>`_ by default. This can be turned off by setting the environment variable ``DOTNET_CLI_TELEMETRY_OPTOUT`` to ``1``. 
