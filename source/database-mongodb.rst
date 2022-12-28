#######
MongoDB
#######

MongoDB is a document-oriented database system. We provide binaries ready to start your own instance.

Refer to the `UberLab guide <https://lab.uberspace.de/en/guide_mongodb.html>`_ for details.


Versions
========

Release types
-------------

We provide major releases and apply security updates on a regular basis.

Standard version
----------------

If you don't select a certain version, our default will be used. We decided to
default to the following version:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version show mongodb
  Using 'mongodb' version: 6.0
  [isabell@stardust ~]$

Show available versions
-----------------------

Use ``uberspace tools version list mongodb`` to show all selectable versions:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version list mongodb
  - 4.2
  - 4.4
  - 5.0
  - 6.0
  [isabell@stardust ~]$

Change version
--------------

You can select the version using ``uberspace tools version use mongodb <version>``:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version use mongodb 4.2
  Selected mongodb version 4.2
  The new configuration is adapted immediately. Minor updates will be applied automatically.
  [isabell@stardust ~]$

Update policy
-------------

We update all major versions on a regular basis. Once the `support
<https://www.mongodb.com/support-policy/lifecycles/>`_ ends, the branch reaches
its end of life (EOL), is no longer supported and will be removed from our
servers.

+--------+------------------+
| Branch | Supported Until  |
+========+==================+
| 4.2    | 2023-04-01       |
+--------+------------------+
| 4.4    | 2024-02-01       |
+--------+------------------+
| 5.0    | 2024-10-01       |
+--------+------------------+
| 6.0    | 2025-07-01       |
+--------+------------------+
