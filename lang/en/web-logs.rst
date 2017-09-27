.. _web-logs:

###############
Web server logs
###############

The web server logs are disabled by default. Once you enable them, they are written to ``/home/$USER/logs/webserver`` (so if your user name is `isabell`, this would be ``/home/isabell/logs/webserver``) in real-time.

access_log
==========

Enabling and disabling
----------------------

To enable or disable your access_log, use these commands:

.. code-block:: bash

 [isabell@doolittle ~]$ uberspace-configure-log enable
 access_log is enabled.
 [isabell@doolittle ~]$ uberspace-configure-log access status
 access_log is enabled.
 [isabell@doolittle ~]$ uberspace-configure-log access disable
 access_log is disabled.
 [isabell@doolittle ~]$ uberspace-configure-log access status
 access_log is disabled.

Contents of the access_log
--------------------------

The ``access_log`` logs all connections to your website. 

.. code-block:: none

    82.98.0.0 - - [22/Jun/2017:09:42:10 +0200] "GET / HTTP/2.0" 200 136 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

Each entry contains the client's (redacted) IP address, date and time of the request, the actual HTTP request sent and the ``user agent``, i.e. the browser and operating system used by the client.

.. _web-logs-error:

error_log
=========

Enabling and disabling
----------------------

At the moment, we only log PHP errors. To enable or disable your error_logs, use these commands:

.. code-block:: bash

 [isabell@doolittle ~]$ uberspace-configure-log error enable
 error_log is enabled.
 [isabell@doolittle ~]$ uberspace-configure-log error status
 error_log is enabled
 [isabell@doolittle ~]$ uberspace-configure-log error disable
 error_log is disabled.
 [isabell@doolittle ~]$ uberspace-configure-log error status
 error_log is disabled.

Contents of the error_log
-------------------------


.. code-block:: none

	[21-Jun-2017 18:40:00] WARNING: [pool www] child 27290 said into stderr: "NOTICE: PHP message: PHP Parse error:  syntax error, unexpected '.', expecting end of file in /var/www/virtual/isabell/html/test.php on line 2"

At the moment, we only provide errors logged by PHP_FPM. Each entry provides the date and time the error occured and the PHP error message, referencing the offending file and line number. 

Privacy
=======

To protect user's privacy, we only log the first 16 bits of an IPv4 address and the first 32 bits of an IPv6 address, respectively, nulling the rest. Thus, ``uberspace.de``'s IPv4 address, ``82.98.87.93`` and its IPv6 address ``2a02:2e0:3fc:52:0:62:5768:38`` are logged as ``82.98.0.0`` and ``2a02:2e0::`` in the actual log files.
