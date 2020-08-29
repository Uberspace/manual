.. sidebar:: Logo
  
  .. image:: _static/images/logo_ruby.png 
      :align: center

####
Ruby
####

Introduction
============

.. warning:: Ruby applications belong in your :ref:`home`, **not** in your :ref:`docroot`.

`Ruby <https://www.ruby-lang.org/en/>`_ is a programming language known for its easy to use `Ruby on Rails` framework.

----

Versions
========

Release types 
-------------

We provide different releases and apply security updates on a regular basis. Currently, these Ruby versions are available: 2.5, 2.6 and 2.7

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 2.5, which is considered to be stable by the developers.

Show available versions
-----------------------

Use ``uberspace tools version list ruby`` to show all selectable versions:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version list ruby
  - 2.5
  - 2.6
  - 2.7
  [eliza@dolittle ~]$ 

.. _node-change-version:

Change version
--------------
You can select the Ruby version with ``uberspace tools version use ruby <version>``. You can choose between release branches:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version use ruby 2.6
  Selected ruby version 2.6
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

Selected version
----------------

You can check the selected version by executing ``uberspace tools version show ruby`` on the command line:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version show ruby
  Using 'ruby' version: 2.5
  [eliza@dolittle ~]$ 

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://www.ruby-lang.org/en/downloads/branches/>`_ reaches its end of life (eol), the branch is no longer supported and will be removed from our servers. 

+--------+----------------------+------------------+ 
| Branch | State                | Supported Until  | 
+========+======================+==================+ 
| 2.4    | eol                  | 2020-03-31       |
+--------+----------------------+------------------+ 
| 2.5    | security maintenance | 2021-03-31       |
+--------+----------------------+------------------+ 
| 2.6    | normal maintenance   | To be determined | 
+--------+----------------------+------------------+ 
| 2.7    | normal maintenance   | To be determined | 
+--------+----------------------+------------------+ 

----

Connection to webserver
=======================

.. include:: includes/web-backend.rst

----

.. _gem:

gem
===

``gem`` is a package manager that can be used to install and manage additional libraries, known as `gems`. We have preconfigured ``gem`` to install libraries to your :ref:`home`.

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-ruby>`_ for guides!
