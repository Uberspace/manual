###
PHP
###

We provide PHP in different versions, selectable via the command line tool :code:`uberspace-select-version`. 

Every fresh setup Uberspace account uses :ref:`standard_php_version`.

Select version
==============

You can select the PHP version with :code:`uberspace-select-version php <version>`. You can choose between major and minor versions, you can't select certain patch versions.

PHP 7
-----

.. _standard_php_version:

latest PHP 7
------------

If you always want to use the latest and greatest PHP 7 (e.g. PHP 7.1, PHP 7.2, PHP 7.3, ...), use the following command:

  .. command-output:: uberspace-select-version php 7
     :shell:

  .. command-output:: php --version
     :shell:

PHP 7.0
-------

If you want to use PHP 7.0, use the following command: 

  .. command-output:: uberspace-select-version php 7.0

You will get the latest patch updates automatically.

PHP 5
-----

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
