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

We provide different releases and apply security updates on a regular basis. Currently available versions are `listed below <#show-available-versions>`_.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to **version 22**, which is considered to be stable by the developers.

Show available versions
-----------------------

Use ``uberspace tools version list node`` to show all selectable versions:

.. code-block:: console

  [isabell@stardust ~]$ uberspace tools version list node
  - 18
  - 20
  - 22
  [isabell@stardust ~]$

.. _node-change-version:

Change version
--------------
You can select the Node.js version with ``uberspace tools version use node <version>``. You can choose between release branches:

.. code-block:: console

  [isabell@stardust ~]$ uberspace tools version use node 20
  Selected node version 20
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [isabell@stardust ~]$

Selected version
----------------

You can check the selected version by executing ``uberspace tools version show node`` on the command line:

.. code-block:: console

  [isabell@stardust ~]$ uberspace tools version show node
  Using 'node' version: '20'
  [isabell@stardust ~]$

Update policy
-------------

We update all versions on a regular basis. Once the `support <https://github.com/nodejs/Release#release-schedule>`_ ends, the branch reaches its end of life (EOL), is no longer supported and will be removed from our servers. Even-numbered versions are long-term support (LTS) versions.

+--------+-------------------------+------------------+
| Branch | State                   | Supported Until  |
+========+=========================+==================+
| 18     | LTS                     | April 2025       |
+--------+-------------------------+------------------+
| 20     | LTS                     | April 2026       |
+--------+-------------------------+------------------+
| 22     | Current                 | April 2027       |
+--------+-------------------------+------------------+

.. include:: includes/deprecation.rst

----

Run node application in the background
======================================

To run your node application in the background we use `supervisord <https://manual.uberspace.de/daemons-supervisord/>`_.


Assuming your application files are located in the sub folder ``~/my-node-app`` of your home directory.
Then place a daemon service file called ``my-daemon.ini`` in ``~/etc/services.d/``:

.. code-block:: ini

 [program:my-daemon]
 directory=/home/isabell/my-node-app
 command=npm run start
 autostart=true
 autorestart=true
 environment=NODE_ENV=production

.. include:: includes/daemons-supervisord-reread-update.rst

Start / Stop node daemon
------------------------

.. include:: includes/daemons-supervisord-start-stop.rst


Connection to webserver
=======================

.. include:: includes/web-backend.rst

----

Available package managers
==========================

.. _npm:

npm
---

``npm``, or the `node package manager`, is used to install and manage additional packages. We have preconfigured ``npm`` to install packages to your :doc:`home <basics-home>` when using the global (``-g``) option.


.. _yarn:

yarn
----

``yarn`` is an alternative node package manager. It is used to install and manage additional packages of your node application.

.. _npx:

npx
---

You can use ``npx`` to quickly execute and test any ``npm`` package without the need to create a nodejs project around it. Check out `nodejs.dev <https://nodejs.dev/learn/the-npx-nodejs-package-runner>`_ to learn more.

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-nodejs>`_ for guides!
