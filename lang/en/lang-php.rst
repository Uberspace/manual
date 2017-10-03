.. _php:

.. sidebar:: Logo
  
  .. image:: ../../images/logo_php.png 
      :align: center

###
PHP
###

Introduction
============

PHP is a server-side scripting language designed primarily for web development but also used as a general-purpose programming language. 

----

Versions
========

Release types 
-------------
Each release branch of PHP is fully supported for two years beginning with its initial stable release. We provide different point releases and apply security updates on a regular basis. Currently, these PHP versions are available: 5.6, 7.0 and 7.1.

Standard version
----------------
If you don't select a certain version, our default will be used. We decided to default to version 7.1, which is considered to be stable by the developers.

.. _php-change-version:

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

Selected version
----------------

You can check the selected version by executing ``php`` on the command line:

.. code-block:: console

  [eliza@dolittle ~]$ php --version
  PHP 7.1.4 (cli) (built: Apr 11 2017 18:26:18) ( NTS )
  Copyright (c) 1997-2017 The PHP Group
  Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
      with Zend OPcache v7.1.4, Copyright (c) 1999-2017, by Zend Technologies

Update policy
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

----

Connection to webserver
=======================

We use the `PHP FastCGI Process Manager (FPM) <http://de2.php.net/manual/en/install.fpm.php>`_ to connect the PHP interpreter to the webserver. Every user has its own PHP-FPM instance that is always running with the following `configuration <http://de2.php.net/manual/en/install.fpm.configuration.php>`_:

.. code-block:: ini

  pm = ondemand
  pm.max_children = 10
  pm.process_idle_timeout = 900s;
  ; The number of requests each child process should execute before respawning.
  pm.max_requests = 500

How to publish
--------------

Put your PHP files into your :ref:`DocumentRoot <docroot>`. The file extension should be ``.php``. For security reasons we don't parse PHP code in every file. 

----

Configuration
=============

.. _php-provided-configuration:

Provided configuration
----------------------

We use a standard ``php.ini`` configuration with minimal modifications to fit the needs of :ref:`popular software <php-popular-software>`:

.. code-block:: ini

 realpath_cache_ttl = 300
 max_execution_time = 600
 max_input_time = 600
 max_input_vars = 1500
 memory_limit = 256M
 date.timezone = Europe/Berlin

We also set the timezone so error logs have the correct times.

Own configuration
-----------------

You can provide your own config files in ``~/etc/php.d``. All files with the extension ``.ini`` will be loaded *additionally* to the stock configuration and existing directives will be overridden.

.. tip:: You need to reload PHP whenever you change your configuration files: ``uberspace-restart-php`` checks your configuration for sanity and reloads your PHP instance.

You can adjust `configuration directives <http://php.net/manual/en/ini.list.php>`_ for all modes: ``PHP_INI_SYSTEM``, ``PHP_INI_USER``, ``PHP_INI_PERDIR`` and ``PHP_INI_ALL``. Put as many directives as you want into these files.

Example
^^^^^^^

.. sidebar:: Hint 

  This example would work without ``uberspace-restart-php`` because the command line ``php`` reads the configuration at execution time. The webserver runs PHP via a daemon that needs to be restarted to parse the new configuration.

In the :ref:`configuration <php-provided-configuration>` we set ``timezone`` to ``Europe/Berlin``. Let's say you want to set the timezone directive to ``UTC``: Create a file ``~/etc/php.d/timezone.ini`` with your new settings and reload your configuration.

When there is an error in your configuration, ``uberspace-restart-php`` tells you what to do. In this case we won't reload your configuration to make sure the invalid configuration does not break your PHP setup.

In this case fix the value and run ``uberspace-restart-php`` again.

.. code-block:: console

 [eliza@dolittle ~]$ php -i | grep date.timezone
 date.timezone => Europe/Berlin => Europe/Berlin
 [eliza@dolittle ~]$ echo "date.timezone = UTC" > ~/etc/php.d/timezone.ini
 [eliza@dolittle ~]$ uberspace-restart-php 
 Your php configuration has been loaded.
 [eliza@dolittle ~]$ php -i | grep date.timezone
 date.timezone => UTC => UTC 

.. code-block:: console

 [eliza@dolittle ~]$ cat ~/etc/php.d/timezone.ini 
 date.timezone = idontexist
 [eliza@dolittle ~]$ uberspace-restart-php 
 Your php configuration is invalid an cannot be loaded. Please examine the following output.
 
 PHP Warning:  Unknown: Invalid date.timezone value 'idontexist', we selected the timezone 'UTC' for now. in Unknown on line 0

Provided modules
----------------

.. csv-table:: Installed modules
   :header: "pecl-zip", "pecl-apcu", "mcrypt", "mbstring", "intl", "xml", "json", "tidy", "gd", "mysqlnd", "pgsql", "imap", "bcmath", "soap", "posix", "shmop", "sysvmsg", "sysvsem", "sysvshm"

.. _php-popular-software:

----

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

----

Debugging
=========

* If you want to debug your PHP application, the :ref:`errorlog <web-logs-error>` is a good place to start.
* Make sure your application is compatible with the :ref:`selected PHP version <php-change-version>`.
