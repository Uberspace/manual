.. sidebar:: Logo

  .. image:: _static/images/logo_dotnet.png
      :align: center

#########
.NET Core
#########

Introduction
============

.. warning:: .NET scripts belong in your :doc:`home <basics-home>`, **not** in your :doc:`docroot <web-documentroot>`.

`.NET <https://www.microsoft.com/net>`_ is a server-side runtime implementation of CLR, the virtual machine that manages the execution of .NET programs. While .NET Core shares a subset of .NET Framework APIs, it comes with its own API that is not part of .NET Framework.

----

Versions
========

Release types
-------------

We provide the latest .NET Core LTS and apply security updates on a regular basis.

We also provide older versions; you can get a full list of curently available versions with ``dotnet --list-sdks``.

.. note:: Unfortunately, Microsoft has decided not to make .NET 8 available for RHEL 7, on which our operating system CentOS 7 is based. Therefore, we cannot provide .NET 8 or later.

Update policy
-------------

We update all `supported versions <https://dotnet.microsoft.com/platform/support/policy/dotnet-core>`_ on a regular basis.

======  ===========  ===============
Branch  State        Supported Until
======  ===========  ===============
7.0     current      2024-05
6.0.2   LTS          2024-11
5.0                  2022-02
3.1                  2022-12-03
2.1                  2021-08-21
======  ===========  ===============


----

Getting started
===============

Check out the `Hello, Console App! <https://docs.microsoft.com/en-us/dotnet/core/tutorials/using-with-xplat-cli>`_.

----

Connection to webserver
=======================

.. include:: includes/web-backend.rst

----

Caveats
=======

Privacy
-------

.NET collects `telemetry data <https://docs.microsoft.com/en-us/dotnet/core/tools/telemetry>`_ by default. This can be turned off by setting the environment variable ``DOTNET_CLI_TELEMETRY_OPTOUT`` to ``1``.
