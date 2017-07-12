
#########
Webserver
#########

*********
Log Files
*********

You can enable access to your account's ``access_log`` and ``error_log``. Both are, by default, deactivated.

access_log
==========

To enable your ``access_log``, run the command ``uberspace-configure-acces_log enable``. Any future requests to your website will be logged in ``~/logs/access_log``. To disable it, run ``uberspace-configure-access_log disable``, and to see the current status, run ``uberspace-configure-access_log status``.

error_log
=========

To enable your ``error_log``, run the command ``uberspace-configure-error_log enable``. Any future requests to your website that result in an HTTP error will be logged in ``~/logs/error_log``. To disable it, run ``uberspace-configure-error_log disable``, and to see the current status, run ``uberspace-configure-error_log status``.