.. _python:

.. sidebar:: Logo
  
  .. image:: _static/images/logo_python.png 
      :align: center

######
Python
######

Introduction
============

Versions
========

Release Types 
-------------
Each release branch of Python is fully supported for five years beginning with its initial stable release. For Python 2.7, this has been extended to ten years. We provide different point releases and apply security updates on a regular basis. Currently, these Python versions are available: 2.7, 3.5, and 3.6. 

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 2.7.

Change version
--------------
To change your python version, run the relevant binary. So if you want to start a script with version 3.6, use the :code:`python3.6` binary:

.. code-block:: console

  [eliza@dolitte ~] python3.6 my-python-script.py

To specify version 2.7 in a `shebang <https://en.wikipedia.org/wiki/Shebang_(Unix)>`_, use :code:`#!/usr/bin/env python2.7`.

Update Policy
-------------

We update all versions on a regular basis. Once the `security support <https://docs.python.org/devguide/index.html#branchstatus>`_ ends, the branch reaches its end of life, is no longer supported and will be removed from our servers.

+--------+---------------------+-----------------------------+
| Branch | State               | Security Support Until      |
+========+=====================+=============================+
| 2.7    | Bug fixes           | January 2020                |
+--------+---------------------+-----------------------------+
| 3.5    | Security fixes only | September 2020              |
+--------+---------------------+-----------------------------+
| 3.6    | Bug fixes           | December 2021               |
+--------+---------------------+-----------------------------+

Connection to webserver
=======================

.. include:: includes/web-backend.rst

pip
===

pip is Python's package manager, used to install and manage additional packages. You can only install software to your :ref:`home directory <home>`, so please always use the :code:`--user` option when running pip.

Versions
--------

In order to install the correct package corresponding to the Python version you want to use, you should run the correct binary. For example, to install a package for Python 2.7, use :code:`pip2.7`:

.. code-block:: console

  [eliza@dolitte ~] pip2.7 install package-name --user 

To install for Python 3.6, use :code:`pip3.6`:

.. code-block:: console

  [eliza@dolitte ~] pip3.6 install package-name --user 

----

Popular software
================

Check out the `⚛️ Uberlab <https://lab.uberspace.de/tags/lang-python>`_ for guides!



