.. _nodejs:

.. sidebar:: Logo
  
  .. image:: _static/images/logo_nodejs.png 
      :align: center

#######
Node.js
#######

Introduction
============

.. warning:: Node.js scripts belong in your :ref:`home`, **not** in your :ref:`docroot`.

`Node.js <https://nodejs.org/en/>`_ is a server-side `JavaScript <https://en.wikipedia.org/wiki/JavaScript>`_ interpreter. Node.js is commonly used to develop server-based applications, i.e. the scripts bind to a network port.


----

Versions
========

Release types 
-------------

We provide different releases and apply security updates on a regular basis. Currently, these Node.js versions are available: 6, 8,9 and 10.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 8, which is considered to be stable by the developers.

Show available versions
-----------------------

Use ``uberspace tools version list node`` to show all selectable versions:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version list node
  - 6
  - 8
  - 9
  - 10
  [eliza@dolittle ~]$ 

.. _node-change-version:

Change version
--------------
You can select the Node.js version with ``uberspace tools version use node <version>``. You can choose between release branches:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version use node 6
  Selected node version 6
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version use node 10
  Selected node version 10
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

Selected version
----------------

You can check the selected version by executing ``uberspace tools version show node`` on the command line:

.. code-block:: bash

  [eliza@dolittle ~]$ uberspace tools version show node
  Using 'node' version: '8
  [eliza@dolittle ~]$ 

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://github.com/nodejs/Release#release-schedule>`_ ends, the branch reaches its end of life (EOL), is no longer supported and will be removed from our servers. Even-numbered versions are long-term support (LTS) versions.

+--------+-------------------------+------------------+ 
| Branch | State                   | Supported Until  | 
+========+=========================+==================+ 
| 6      | Maintenance LTS         | April 2019       | 
+--------+-------------------------+------------------+ 
| 8      | LTS                     | December 2019    |
+--------+-------------------------+------------------+ 
| 9      | EOL                     | June 2018        | 
+--------+-------------------------+------------------+ 
| 10     | LTS                     | April 2021       |
+--------+-------------------------+------------------+ 

----

Connection to webserver
=======================

In order to make your Node.js application accessable from the outside, you need to connect it to the webserver. This is done using a proxy ``RewriteRule`` to forward requests to the application's network port. For example, if your application is listening on port 61624 and you want it to be accessable at ``https://<user>.uber.space/nodejs/``, place an :ref:`.htaccess <htaccess>` file looking like this in your :ref:`docroot`:

.. code-block:: apacheconf

  RewriteEngine On
  RewriteRule ^nodejs/(.*) http://localhost:61624/$1 [P]

.. include:: includes/htaccess-directoryindex.txt

----

.. _npm:

npm
===

``npm``, or the `node package manager`, is used to install and manage additional packages. We have preconfigured ``npm`` to install packages to your :ref:`home` when using the global (``-g``) option.

----

Popular software
================

+--------------------------------------------------------------------+----------------------------+ 
| Name                                                               | Kind                       | 
+====================================================================+============================+
| `Ghost <https://lab.uberspace.de/en/guide_ghost.html>`_            | Blog                       | 
+--------------------------------------------------------------------+----------------------------+ 
| `Etherpad Lite <https://lab.uberspace.de/en/guide_etherpad.html>`_ | collaborative writing tool |
+--------------------------------------------------------------------+----------------------------+ 

