
###
PHP
###

We provide PHP in different versions, selectable via the command line tool :code:`uberspace-select-version`. 

Every fresh setup Uberspace account uses the :ref:`standard_php_version`.

*************************
Which version am I using?
*************************

You can always check which PHP version you're currently using.

On the command line
===================

.. code-block bash ::
 [eliza@doolittle ~] $ php --version
 PHP 7.1.5 (cli) (built: May  9 2017 17:04:23) ( NTS )
 Copyright (c) 1997-2017 The PHP Group
 Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
     with Zend OPcache v7.1.5, Copyright (c) 1999-2017, by Zend Technologies

On the web
==========

You can also check your current PHP version by creating a PHP file that calls the function :code:`phpinfo()`:

.. code-block:: php
   :name: phpinfo.php

   <?php
   phpinfo();
   ?>

If you name this file phpinfo.php and place it in your document root, you can access it at https://username.uber.space/phpinfo.php. Your current PHP version is printed in the top line. You can also see many other 

**************
Change version
**************

You can select the PHP version with :code:`uberspace-select-version php <version>`. You can choose between major (such as 7) and minor versions (e.g. 7.1), you can't select certain patch versions (e.g. 7.1.4).

PHP 7
=====

.. _standard_php_version:

latest PHP 7
------------

If you always want to use the latest and greatest PHP 7 (e.g. PHP 7.1, PHP 7.2, PHP 7.3, …), use the following command:

.. code-block bash ::
 [eliza@doolittle ~]$ uberspace-select-version php 7
 Selected PHP version 7
 The new configuration is adapted immediately. Minor updates will be applied automatically.

.. code-block bash ::
 [eliza@doolittle ~]$ php --version
 PHP 7.0.19 (cli) (built: May  9 2017 15:07:17) ( NTS )
 Copyright (c) 1997-2017 The PHP Group
 Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies
     with Zend OPcache v7.0.19, Copyright (c) 1999-2017, by Zend Technologies


PHP 7.0
-------

If you want to use PHP 7.0, use the following command: 

.. code-block bash ::
 [eliza@doolittle ~]$ uberspace-select-version php 7.0
 Selected PHP version 7.0
 The new configuration is adapted immediately. Patch updates will be applied automatically.

.. code-block bash ::
 [eliza@doolittle ~]$ php --version
 PHP 7.0.19 (cli) (built: May  9 2017 15:07:17) ( NTS )
 Copyright (c) 1997-2017 The PHP Group
 Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies
     with Zend OPcache v7.0.19, Copyright (c) 1999-2017, by Zend Technologies
 You will get the latest patch updates automatically.

PHP 5
=====

If you still need to use PHP 5, use one of the following commands:

latest PHP 5
------------

.. code-block bash ::
 [eliza@doolittle ~]$ uberspace-select-version php 5
 Selected PHP version 5
 The new configuration is adapted immediately. Minor updates will be applied automatically.

.. code-block bash ::
 [eliza@doolittle ~]$ php --version
 PHP 5.6.30 (cli) (built: Jan 19 2017 07:08:58)
 Copyright (c) 1997-2016 The PHP Group
 Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
     with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies


PHP 5.6
-------

For a specific minor version the command would be:

.. code-block bash ::
 [eliza@doolittle ~]$ uberspace-select-version php 5.6
 Selected PHP version 5.6
 The new configuration is adapted immediately. Minor updates will be applied automatically.

.. code-block bash ::
 [eliza@doolittle ~]$ php --version
 PHP 5.6.30 (cli) (built: Jan 19 2017 07:08:58)
 Copyright (c) 1997-2016 The PHP Group
 Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
     with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
