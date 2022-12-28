.. sidebar:: Logo

  .. image:: _static/images/logo_erlang.png
      :align: center

##########
Erlang OTP
##########

Introduction
============

`Erlang <https://www.erlang.org>`__ is a general-purpose, concurrent, functional programming language, and a garbage-collected runtime system. The term Erlang is used interchangeably with Erlang/OTP, or Open Telecom Platform (OTP), which consists of the Erlang runtime system, several ready-to-use components (OTP) mainly written in Erlang, and a set of design principles for Erlang programs.


----

Versions
========

Release types
-------------

We provide different releases and apply security updates on a regular basis. Currently available versions are `listed below <#show-available-versions>`_. All versions include `Elixir <https://elixir-lang.org>`_ and `Mix <https://hexdocs.pm/mix/Mix.html>`_, a build tool that allows you to easily create projects, manage tasks, run tests and more.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 21

Show available versions
-----------------------

Use ``uberspace tools version list erlang`` to show all selectable versions:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version list erlang
  - 20
  - 21
  - 22
  - 23
  - 24
  - 25
  [isabell@stardust ~]$

.. _erlang-change-version:

Change version
--------------
You can select the Erlang/OTP version with ``uberspace tools version use erlang <version>``. You can choose between release branches:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version use erlang 22
  Selected Erlang/OTP version 22
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [isabell@stardust ~]$

Selected version
----------------

You can check the selected version by executing ``uberspace tools version show erlang`` on the command line:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version show erlang
  Using 'erlang' version: '25'
  [isabell@stardust ~]$

Update policy
-------------

We update all versions on a regular basis.

.. include:: includes/deprecation.rst

----

Connection to webserver
=======================

.. include:: includes/web-backend.rst

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-erlang>`_ for guides!

