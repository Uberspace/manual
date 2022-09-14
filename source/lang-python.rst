.. sidebar:: Logo

  .. image:: _static/images/logo_python.png
      :align: center

######
Python
######

Introduction
============

.. warning:: Python applications belong in your :doc:`home <basics-home>`, **not** in your :doc:`docroot <web-documentroot>`.

Python is an interpreted programming language, created by Guido van Rossum in
1991. It is used for a wide range of tasks from basic scripting to full-fledged
web applications.

Versions
========

Release Types
-------------
Each release branch of Python is fully supported for five years beginning with its initial stable release. For Python 2.7, this has been extended to ten years. For more details see `Update Policy <https://manual.uberspace.de/lang-python/#update-policy>`_.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 2.7.

Change version
--------------
To change your python version, run the relevant binary. So if you want to start a script with version 3.6, use the :code:`python3.6` binary:

.. code-block:: console

  [isabell@stardust ~] python3.6 my-python-script.py

To specify version 2.7 in a `shebang <https://en.wikipedia.org/wiki/Shebang_(Unix)>`_, use :code:`#!/usr/bin/env python2.7`.

Update Policy
-------------

We update all versions of Python on a regular basis. Once the `security support <https://docs.python.org/devguide/index.html#branchstatus>`_ ends, the branch reaches its end of life, is no longer supported and will be removed from our servers.

+--------+---------------------+-----------------------------+
| Branch | State               | Security Support Until      |
+========+=====================+=============================+
| 2.7    | Security fixes only | January 2024 (by CentOS)    |
+--------+---------------------+-----------------------------+
| 3.6    | Security fixes only | January 2024 (by CentOS)    |
+--------+---------------------+-----------------------------+
| 3.7    | Bug fixes           | 2023                        |
+--------+---------------------+-----------------------------+
| 3.8    | Bug fixes           | 2024                        |
+--------+---------------------+-----------------------------+
| 3.9    | Bug fixes           | 2025                        |
+--------+---------------------+-----------------------------+

Connection to webserver
=======================

.. include:: includes/web-backend.rst

pip
===

pip is Python's package manager, used to install and manage additional packages. You can only install software to your :doc:`home directory <basics-home>`, so please always use the :code:`--user` option when running pip.

Versions
--------

In order to install the correct package corresponding to the Python version you want to use, you should run the correct binary. For example, to install a package for Python 2.7, use :code:`pip2.7`:

.. code-block:: console

  [isabell@stardust ~] pip2.7 install package-name --user

To install for Python 3.6, use :code:`pip3.6`:

.. code-block:: console

  [isabell@stardust ~] pip3.6 install package-name --user

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-python>`_ for guides!



