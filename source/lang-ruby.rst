.. sidebar:: Logo

  .. image:: _static/images/logo_ruby.png
      :align: center

####
Ruby
####

Introduction
============

.. warning:: Ruby applications belong in your :doc:`home <basics-home>`, **not** in your :doc:`docroot <web-documentroot>`.

`Ruby <https://www.ruby-lang.org/en/>`_ is a programming language known for its easy to use `Ruby on Rails` framework.

----

Versions
========

Release types
-------------

We provide different releases and apply security updates on a regular basis. Currently available versions are `listed below <#show-available-versions>`_.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version ``3.2``, which is considered to be stable by the developers.

Show available versions
-----------------------

Use ``uberspace tools version list ruby`` to show all selectable versions:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version list ruby
  - 3.1
  - 3.2
  - 3.3
  - 3.4
  [isabell@stardust ~]$

.. _ruby-change-version:

Change version
--------------
You can select the Ruby version with ``uberspace tools version use ruby <version>``. You can choose between release branches:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version use ruby 3.1
  Selected ruby version 3.1
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [isabell@stardust ~]$

Selected version
----------------

You can check the selected version by executing ``uberspace tools version show ruby`` on the command line:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version show ruby
  Using 'ruby' version: 3.1
  [isabell@stardust ~]$

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://www.ruby-lang.org/en/downloads/branches/>`_ reaches its end of life (eol), the branch is no longer supported and will be removed from our servers.

+--------+------------------+
| Branch | Supported Until  |
+========+==================+
| 3.1    | 2025-12-25       |
+--------+------------------+
| 3.2    | 2026-03-31       |
+--------+------------------+
| 3.3    | 2027-03-31       |
+--------+------------------+
| 3.4    | TBD              |
+--------+------------------+

.. include:: includes/deprecation.rst

----

Connection to webserver
=======================

.. include:: includes/web-backend.rst

----

.. _gem:

gem
===

``gem`` is a package manager that can be used to install and manage additional libraries, known as `gems`. We have preconfigured ``gem`` to install libraries to your :doc:`home <basics-home>`.

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-ruby>`_ for guides!
