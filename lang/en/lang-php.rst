.. _php:

###
PHP
###

Introduction
============

PHP is a server-side scripting language designed primarily for web development but also used as a general-purpose programming language. 

Versions
========

default
-------
If you don't select a certain version, our default will be used. We decided to default to Version 7.1, what is considered to be stable by the developers.

select version
--------------
You can select the PHP version with :code:`uberspace-select-version php <version>`. You can choose between major and minor versions, you can't select certain patch versions.

If you always want to use the latest and greatest PHP 7 (e.g. PHP 7.1, PHP 7.2, PHP 7.3, ...), use the following command:

.. code-block:: console

  [eliza@dolittle ~]$ uberspace-select-version php 7
  Selected PHP version 7
  The new configuration is adapted immediately. Minor updates will be applied automatically.
  [eliza@dolittle ~]$ 

If you want to pin to a specific minor release, use the following command: 

.. code-block:: console

  [eliza@dolittle ~]$ uberspace-select-version php 7.1
  Selected PHP version 7.1
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

.. 
  Available versions
  ------------------
  not implemented at the moment.

selected version
----------------

Simply run

.. code-block:: console

  [eliza@dolittle ~]$ php --version
  PHP 7.1.4 (cli) (built: Apr 11 2017 18:26:18) ( NTS )
  Copyright (c) 1997-2017 The PHP Group
  Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
      with Zend OPcache v7.1.4, Copyright (c) 1999-2017, by Zend Technologies
  [eliza@dolittle ~]$ 

php.ini
=======

We generally use a standard `php.ini` configuration with only slight modifications:

.. code-block:: none
 realpath_cache_ttl = 300
 max_execution_time = 600
 max_input_time = 600
 max_input_vars = 1500
 memory_limit = 256M
 date.timezone = Europe/Berlin

This fits the needs of popular PHP software, such as Wordpress or Nextcloud, so they work out of the box and you don't have to create your own `php.ini` with these settings. We also set the timezone so error logs have the correct times.

.. 
  Connection to webserver
  =======================
  How to publish
  --------------

  Configuration
  =============
  provided configuration
  ----------------------
  additional / own configuration
  ------------------------------
  provided extensions / modules
  -----------------------------
  additional extensions / modules
  -------------------------------

  Best practices
  ==============
  security
  --------

  Known problems and caveats
  ==========================

  Popular software
  ================
