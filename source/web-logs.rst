.. _web-logs:

###############
Web server logs
###############

The web server logs are disabled by default. Once you enable them, they are written to ``/home/$USER/logs/webserver`` (so if your user name is `isabell`, this would be ``/home/isabell/logs/webserver``) in real-time.

.. note::

   Disabling logs deletes all existing logs!

Access Log
==========

Enabling and disabling
----------------------

To enable or disable your access log, use these commands:

.. code-block:: console

 [isabell@doolittle ~]$ uberspace web log access enable
 access log is enabled
 the logfiles will be saved to ~/logs/webserver/access_log
 [isabell@doolittle ~]$ uberspace web log access status
 access log is enabled
 the logfiles will be saved to ~/logs/webserver/access_log
 [isabell@doolittle ~]$ uberspace web log access disable
 access log is disabled
 the logfiles in ~/logs/webserver/access_log have been removed
 [isabell@doolittle ~]$ uberspace web log access status
 access log is disabled

Contents of the access_log
--------------------------

The ``access_log`` logs all connections to your website:

.. code-block:: none

    isabell.uber.space:443 10.132.0.0 - - [28/Apr/2021:16:10:23 +0000] "GET /hello/world.php HTTP/1.1" 200 42 "-" "HTTPie/0.9.4"

Each entry starts with the *server name* of the virtual host handling the
request and the *port* on which the request was accepted (i.e. 80 or 443). The
*server_name* is the domain for the request, i.e. one of the ones `you added
<web-domains.html>`_ or the default (``isabell.uber.space``). These are followed
by the client's (redacted) *IP address*, ``-`` and the authorized user (if any,
otherwise ``-``), *date and time* of the request, the actual *HTTP request*
sent, the *referrer* (if any, otherwise ``-``) and the *user agent*
string, i.e. the browser and operating system used by the client. This format is
often called ``VCOMBINED`` or ``NCSA with VHOST``.

.. _web-logs-error:

Error Log: Apache
=================

Enabling and disabling
----------------------

To enable or disable your Apache error log, use these commands:

.. code-block:: console

 [isabell@doolittle ~]$ uberspace web log apache_error enable
 apache error log is enabled
 the logfiles will be saved to ~/logs/webserver/error_log_apache
 NOTE: consider that your app might be writing to its own logfiles and not to the system logs
 [isabell@doolittle ~]$ uberspace web log apache_error status
 apache error log is enabled
 the logfiles will be saved to ~/logs/webserver/error_log_apache
 NOTE: consider that your app might be writing to its own logfiles and not to the system logs
 [isabell@doolittle ~]$ uberspace web log apache_error disable
 apache error log is disabled
 the logfiles in ~/logs/webserver/access_log have been removed
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

.. code-block:: console

 [isabell@doolittle ~]$ uberspace web log php_error enable
 php error log is enabled
 the logfiles will be saved to ~/logs/error_log_php
 NOTE: consider that your app might be writing to its own logfiles and not to the system logs
 [isabell@doolittle ~]$ uberspace web log php_error status
 php error log is enabled
 the logfiles will be saved to ~/logs/error_log_php
 NOTE: consider that your app might be writing to its own logfiles and not to the system logs
 [isabell@doolittle ~]$ uberspace web log php_error disable
 php error log is disabled
 the logfiles in ~/logs/error_log_php have been removed
 [isabell@doolittle ~]$ uberspace web log php_error status
 php error log is disabled

Contents of the error_log_php
-----------------------------

The ``/home/$USER/logs/error_log_php`` logs errors encountered by PHP on your website:

.. code-block:: none

	[21-Jun-2017 18:40:00] WARNING: [pool www] child 27290 said into stderr: "NOTICE: PHP message: PHP Parse error:  syntax error, unexpected '.', expecting end of file in /var/www/virtual/isabell/html/test.php on line 2"

We provide errors logged by PHP_FPM. Each entry provides the date and time the error occurred and the PHP error message, referencing the offending file and line number.


Privacy
=======

To protect user's privacy, we only log the first 16 bits of an IPv4 address and the first 32 bits of an IPv6 address, respectively, nulling the rest. Thus, ``uberspace.de``'s IPv4 address, ``82.98.87.93`` and its IPv6 address ``2a02:2e0:3fc:52:0:62:5768:38`` are logged as ``82.98.0.0`` and ``2a02:2e0::`` in the actual log files.

Log files are rotated daily and deleted after 7 days of retention.
