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

We provide different releases and apply security updates on a regular basis. Currently, these Ruby versions are available: 2.3, 2.4, and 2.5

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 2.5, which is considered to be stable by the developers.

Show available versions
-----------------------

Use ``uberspace tools version list ruby`` to show all selectable versions:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version list ruby
  - 2.3
  - 2.4
  - 2.5
  [eliza@dolittle ~]$ 

.. _node-change-version:

Change version
--------------
You can select the Ruby version with ``uberspace tools version use ruby <version>``. You can choose between release branches:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version use ruby 2.3
  Selected ruby version 2.3
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version use ruby 2.4
  Selected ruby version 2.4
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

+--------+--------------------+------------------+ 
| Branch | State              | Supported Until  | 
+========+====================+==================+ 
| 2.3    | normal maintenance | To be determined | 
+--------+--------------------+------------------+ 
| 2.4    | normal maintenance | To be determined |
+--------+--------------------+------------------+ 
| 2.5    | normal maintenance | To be determined | 
+--------+--------------------+------------------+ 

----

Connection to webserver
=======================

In order to make your Ruby application accessable from the outside, you need to connect it to the webserver. This is done using a proxy ``RewriteRule`` to forward requests to the application's network port. For example, if your application is listening on port 61624 and you want it to be accessable at ``https://<user>.uber.space/ruby/``, place an :ref:`.htaccess <htaccess>` file looking like this in your :ref:`docroot`:

.. code-block:: apacheconf

  RewriteEngine On
  RewriteRule ^ruby/(.*) http://localhost:61624/$1 [P]

.. include:: includes/htaccess-documentindex.txt

----

.. _gem:

gem
===

``gem`` is a package manager that can be used to install and manage additional libraries, known as `gems`. We have preconfigured ``gem`` to install libraries to your :ref:`home`.
