.. _couchdb:

#######
CouchDB
#######

CouchDB is a document-oriented database system. We provide binaries ready to start your own instance.

Refer to the `UberLab guide <https://lab.uberspace.de/en/guide_couchdb.html>`_ for details.


Versions
========

Release types
-------------

We provide version 3 and apply security updates on a regular basis.

Standard version
----------------

If you don't select a certain version, our default will be used. We decided to
default to the following version:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version show couchdb
  Using 'couchdb' version: 3
  [isabell@stardust ~]$

Show available versions
-----------------------

Use ``uberspace tools version list couchdb`` to show all selectable versions:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version list couchdb
  - 3
  [isabell@stardust ~]$

Change version
--------------

Once a new version is released, you can select it using ``uberspace tools version use couchdb <version>``:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace tools version use couchdb 3
  Selected couchdb version 3
  The new configuration is adapted immediately. Minor updates will be applied automatically.
  [isabell@stardust ~]$

Update policy
-------------

We currently offer version 3 only, which is in active development. Once new versions are released, we'll provide them.
