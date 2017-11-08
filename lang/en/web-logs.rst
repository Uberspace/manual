.. _web-logs:

###############
Web server logs
###############

The web server logs are disabled by default. Once you enable them, they are written to ``/home/$USER/logs/webserver`` (so if your user name is `isabell`, this would be ``/home/isabell/logs/webserver``) in real-time.


Access Log
==========

Enabling and disabling
----------------------

To enable or disable your access log, use these commands:

.. code-block:: bash

 [isabell@doolittle ~]$ uberspace web log access enable
 access log is enabled
 [isabell@doolittle ~]$ uberspace web log access status
 access log is enabled
 [isabell@doolittle ~]$ uberspace web log access disable
 access log is disabled
 [isabell@doolittle ~]$ uberspace web log access status
 access log is disabled

Contents of the access_log
--------------------------

The ``access_log`` logs all connections to your website:

.. code-block:: none

    82.98.0.0 - - [22/Jun/2017:09:42:10 +0200] "GET / HTTP/2.0" 200 136 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

Each entry contains the client's (redacted) IP address, date and time of the request, the actual HTTP request sent and the ``user agent``, i.e. the browser and operating system used by the client.


.. _web-logs-error:

Error Log: Apache
=================

Enabling and disabling
----------------------

To enable or disable your Apache error log, use these commands:

.. code-block:: bash

 [isabell@doolittle ~]$ uberspace web log apache_error enable
 apache error log is enabled
 [isabell@doolittle ~]$ uberspace web log apache_error status
 apache error log is enabled
 [isabell@doolittle ~]$ uberspace web log apache_error disable
 apache error log is disabled
 [isabell@doolittle ~]$ uberspace web log apache_error status
 apache error log is disabled

Contents of the error_log_apache
--------------------------------

The ``error_log_apache`` logs errors encountered by Apache while handling your website — probably mostly problems with `.htaccess` files:

.. code-block:: none

    [Thu Oct 19 16:41:00 2017] [alert] [pid 11908] config.c(2143): [client 82.98.0.0] /var/www/virtual/isabell/html/.htaccess: Invalid command 'xxo', perhaps misspelled or defined by a module not included in the server configuration

Each entry provides the date and time the error occurred, the log level, process ID and the location of the error in the source, followed by the client's IP and the error message.


Error Log: PHP
==============

Enabling and disabling
----------------------

To enable or disable your PHP error log, use these commands:

.. code-block:: bash

 [isabell@doolittle ~]$ uberspace web log php_error enable
 php error log is enabled
 [isabell@doolittle ~]$ uberspace web log php_error status
 php error log is enabled
 [isabell@doolittle ~]$ uberspace web log php_error disable
 php error log is disabled
 [isabell@doolittle ~]$ uberspace web log php_error status
 php error log is disabled

Contents of the error_log_php
-----------------------------

The ``error_log_php`` logs errors encountered by PHP on your website:

.. code-block:: none

	[21-Jun-2017 18:40:00] WARNING: [pool www] child 27290 said into stderr: "NOTICE: PHP message: PHP Parse error:  syntax error, unexpected '.', expecting end of file in /var/www/virtual/isabell/html/test.php on line 2"

We provide errors logged by PHP_FPM. Each entry provides the date and time the error occurred and the PHP error message, referencing the offending file and line number.


Privacy
=======

To protect user's privacy, we only log the first 16 bits of an IPv4 address and the first 32 bits of an IPv6 address, respectively, nulling the rest. Thus, ``uberspace.de``'s IPv4 address, ``82.98.87.93`` and its IPv6 address ``2a02:2e0:3fc:52:0:62:5768:38`` are logged as ``82.98.0.0`` and ``2a02:2e0::`` in the actual log files.
