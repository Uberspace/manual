
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

.. command-output:: php --version
   :shell:

On the web
==========

You can also check your current PHP version by creating a PHP file that calls the function :code:`phpinfo()`:

.. code-block:: php
   :name: phpinfo.php

   <?php
   phpinfo();
   ?>

If you name this file phpinfo.php and place it in your document root, you can access it at https://username.host.uberspace.de/phpinfo.php. Your current PHP version is printed in the top line. You can also see many other 

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

  .. command-output:: uberspace-select-version php 7
     :shell:

  .. command-output:: php --version
     :shell:

PHP 7.0
-------

If you want to use PHP 7.0, use the following command: 

  .. command-output:: uberspace-select-version php 7.0
     :shell:

You will get the latest patch updates automatically.

PHP 5
=====

If you still need to use PHP 5, use one of the following commands:

latest PHP 5
------------

  .. command-output:: uberspace-select-version php 5
     :shell:

  .. command-output:: php --version
     :shell:
     
PHP 5.6
-------

For a specific minor version the command would be:

  .. command-output:: uberspace-select-version php 5.6
     :shell:
