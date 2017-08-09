.. _php:

###
PHP
###

Introduction
============

PHP is a server-side scripting language designed primarily for web development but also used as a general-purpose programming language. 

Versions
========

Release Types 
-------------
Each release branch of PHP is fully supported for two years from its initial stable release. During this period, bugs and security issues that have been reported are fixed and are released in regular point releases. We provide all currently supported versions: 5.6, 7.0 and 7.1.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to Version 7.1, what is considered to be stable by the developers.

Change version
--------------
You can select the PHP version with :code:`uberspace-select-version php <version>`. You can choose between release branches:

.. code-block:: console

  [eliza@dolittle ~]$ uberspace-select-version php 7.1
  Selected PHP version 7.1
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

.. code-block:: console

  [eliza@dolittle ~]$ uberspace-select-version php 5.6
  Selected PHP version 5.6
  The new configuration is adapted immediately. Patch updates will be applied automatically.
  [eliza@dolittle ~]$ 

If you always want to use the latest and greatest PHP 7 (e.g. PHP 7.1, PHP 7.2, PHP 7.3, ...), use the following command:

.. code-block:: console

  [eliza@dolittle ~]$ uberspace-select-version php 7
  Selected PHP version 7
  The new configuration is adapted immediately. Minor updates will be applied automatically.
  [eliza@dolittle ~]$ 

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

Update Policy
-------------

We update all versions on a regular basis. Once the `security support <http://php.net/supported-versions.php>`_ ends, the branch reaches its end of life, is no longer supported and will be removed from our servers.

+--------+---------------------+------------------------+ 
| Branch | State               | Security Support Until | 
+========+=====================+========================+ 
| 5.6    | Security fixes only | 31 Dec 2018            | 
+--------+---------------------+------------------------+ 
| 7.0    | Active support      | 3 Dec 2018             |
+--------+---------------------+------------------------+ 
| 7.1    | Active support      | 1 Dec 2019             | 
+--------+---------------------+------------------------+

Connection to webserver
=======================

We use the `PHP FastCGI Process Manager (FPM) <http://de2.php.net/manual/en/install.fpm.php>`_ to connect the PHP interpreter to the webserver. Eyery user has its own PHP-FPM instance that is always running with the following `configuration <http://de2.php.net/manual/en/install.fpm.configuration.php>`_:

.. code-block:: ini

  pm = ondemand
  pm.max_children = 10
  pm.process_idle_timeout = 900s;
  ; The number of requests each child process should execute before respawning.
  pm.max_requests = 500

How to publish
--------------

Just put your PHP files into your :ref:`DocumentRoot <docroot>`, the file extension should be ``.php``, for security reasons we don't parse PHP code in every file. 

Configuration
=============

provided configuration
----------------------

We generally use a standard ``php.ini`` configuration with slight modifications to fit the needs of :ref:`popular software <php-popular-software>`:

.. code-block:: ini

 realpath_cache_ttl = 300
 max_execution_time = 600
 max_input_time = 600
 max_input_vars = 1500
 memory_limit = 256M
 date.timezone = Europe/Berlin

We also set the timezone so error logs have the correct times.

provided modules
-----------------------------

We provide the following modules:

  - pecl-zip
  - pecl-apcu
  - mcrypt
  - mbstring
  - intl
  - xml
  - json
  - tidy
  - gd
  - mysqlnd
  - pgsql
  - imap
  - bcmath

.. _php-popular-software:

Popular software
================

+----------------------------------------+---------------------------+ 
| Name                                   | Kind                      | 
+========================================+===========================+
| `Wordpress <https://wordpress.org>`_   | content management system | 
+----------------------------------------+---------------------------+ 
| `Nextcloud <https://nextcloud.com>`_   | file hosting services     |
+----------------------------------------+---------------------------+ 
| `Magento <https://magento.com>`_       | online shop               |
+----------------------------------------+---------------------------+ 
| `Drupal <https://www.drupal.org>`_     | content management system |
+----------------------------------------+---------------------------+ 
| `Joomla <https://www.joomla.org>`_     | content management system |
+----------------------------------------+---------------------------+ 
