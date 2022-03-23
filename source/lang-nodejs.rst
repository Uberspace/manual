.. sidebar:: Logo

  .. image:: _static/images/logo_nodejs.png
      :align: center

#######
Node.js
#######

Introduction
============

.. warning:: Node.js scripts belong in your :doc:`home <basics-home>`, **not** in your :doc:`docroot <web-documentroot>`.

`Node.js <https://nodejs.org/en/>`_ is a server-side `JavaScript <https://en.wikipedia.org/wiki/JavaScript>`_ interpreter. Node.js is commonly used to develop server-based applications, i.e. the scripts bind to a network port.

----

Versions
========

Release types
-------------

We provide different releases and apply security updates on a regular basis. Currently, these Node.js versions are available: 12, 14, and **16**

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to **version 16**, which is considered to be stable by the developers.

Show available versions
-----------------------

Use ``uberspace tools version list node`` to show all selectable versions:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version list node
  - 12
  - 14
  - 16
  [isabell@stardust ~]$

.. _node-change-version:

Change version
--------------
You can select the Node.js version with ``uberspace tools version use node <version>``. You can choose between release branches:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version use node 14
  Selected node version 14
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [isabell@stardust ~]$

Selected version
----------------

You can check the selected version by executing ``uberspace tools version show node`` on the command line:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version show node
  Using 'node' version: '16'
  [isabell@stardust ~]$

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://github.com/nodejs/Release#release-schedule>`_ ends, the branch reaches its end of life (EOL), is no longer supported and will be removed from our servers. Even-numbered versions are long-term support (LTS) versions.

+--------+-------------------------+------------------+
| Branch | State                   | Supported Until  |
+========+=========================+==================+
| 12     | Maintenance             | April 2022       |
+--------+-------------------------+------------------+
| 14     | Active                  | April 2024       |
+--------+-------------------------+------------------+
| 16     | Current                 | April 2024       |
+--------+-------------------------+------------------+

Connection to webserver
=======================

.. include:: includes/web-backend.rst

----

.. _npm:

npm
===

``npm``, or the `node package manager`, is used to install and manage additional packages. We have preconfigured ``npm`` to install packages to your :doc:`home <basics-home>` when using the global (``-g``) option.

----

.. _npx:

npx
===

You can use ``npx`` to quickly execute and test any ``npm`` package without the need to create a nodejs project around it. Check out `nodejs.dev <https://nodejs.dev/learn/the-npx-nodejs-package-runner>`_ to learn more.

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-nodejs>`_ for guides!
