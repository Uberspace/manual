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

We provide the latest .NET Core LTS and apply security updates on a regular basis.

We also provide older versions; you can get a full list of curently available versions with ``dotnet --list-sdks``.

Update policy
-------------

We update all `supported versions <https://dotnet.microsoft.com/platform/support/policy/dotnet-core>`_ on a regular basis.

======  ===========  ===============
Branch  State        Supported Until
======  ===========  ===============
3.1     current LTS  2022-12-03
2.1     old LTS      2021-08-21
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
