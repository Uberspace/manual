.. _web-logs:
Web server logs
===============

Requests to your website are logged automatically to files placed in ``/var/www/virtual/$USER/logs/`` (so if your user name is isabell, that would be ``/var/www/virtual/isabell/logs/``) in real-time.

access_log
----------

The ``access_log`` logs all connections to your website. 

.. code-block:: none

    82.98.0.0 - - [22/Jun/2017:09:42:10 +0200] "GET / HTTP/2.0" 200 136 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

Each entry contains the client's (redacted) IP address, date and time of the request, the actual HTTP request sent and the ``user agent``, i.e. the browser and operating system used by the client.

To protect user's privacy, we only log the first 16 bits of an IPv4 address and the first 32 bits of an IPv6 address, respectively, nulling the rest. Thus, an IPv4 address such as ``82.98.87.93`` and an IPv6 address such as ``2a02:2e0:3fc:52:0:62:5768:38`` are logged as ``82.98.0.0`` and ``2a02:2e0::`` in the actual log file.


error_log
---------

.. code-block:: none

	[21-Jun-2017 18:40:00] WARNING: [pool www] child 27290 said into stderr: "NOTICE: PHP message: PHP Parse error:  syntax error, unexpected '.', expecting end of file in /var/www/virtual/isabell/html/test.php on line 2"

At the moment, we only provide errors logged by PHP_FPM. Each entry provides the date and time the error occured and the PHP error message, referencing the offending file and line number. 