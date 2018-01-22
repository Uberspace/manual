.. _changelog:

######################
Changes in Uberspace 7
######################

This document will track major changes in the project.

[7.0.25] - 2018-01-22
=====================

.. _lastchange:

Added
-----

* We now provide ImageMagick commands like “convert” on the command line.
* We now provide :ref:`Ruby <ruby>` in user selectable versions: 2.3, 2.4 and 2.5.
  
Fixed
-----

* The :ref:`PHP-FPM <php>` and :ref:`supervisor <supervisord>` user services now run under their user's :ref:`ressource restrictions <resources>`. 

----

.. _oldentries:

[7.0.24] - 2018-01-16
=====================

Added
-----

* All servers now come with pandoc (to convert document formats), tree (to view your directory structures in a pretty way), and imapsync (to transfer emails between IMAP accounts) installed.
* We now provide development headers for the ncurses GUI library.
* We now provide the “gmp” module for php.
* For your network debugging needs, we now offer traceroute and mtr.

Changed
-------

* The $PATH of qmail is now extended by standard directories like /bin, so maildrop can be called without specifying its full path.
* We now automatically restart php-fpm of your web services on updates or when new php modules are added.
* Apache now uses the “event” multi processing module instead of the old “prefork”. This allows us to handle more requests in parallel.
* The number of HTTP slots, which can be used by a single uberspace is now limited, so a single uberspace cannot overload our webservers.

Fixed
-----

* After numerous attempts to install “git submodules” and various other git sub-commands, we now got it. finally. maybe.
* On reboot, supervisord user services might be started before MySQL, causing some of them to fail. They are now only started, once MySQL is fully booted.
* Generating the nginx config takes too long in some cases, causing a timeout and nginx to be permanently down. We increased the timeout. The faulty script will be optimized at a later date. 

----

[7.0.23] - 2018-01-03
=====================

Fixed
-----

* Under rare conditions some users did not get a let’s encrypt certificate for a small percentage of their requests. This has been corrected.

----

[7.0.22] - 2017-12-20
=====================

Added
-----

* In preparation for a public status dashboard, our servers now have additional black box monitoring.
* Popular default ports like 9001 are now blocked. 

Changed
-------

* The maximum number of processes/threads is now 400 instead of 300, which allows weechat to be compiled using linuxbrew.

Fixed
-----

* Usernames did have a minimal length of two. This is wrong. We changed it to one, so it matches Uberspace 6.
* Because of an oversight, VMailMgr was never correctly set up for existing users users. This has been corrected.
* The vMailMgr wrappers now support Unicode and the char–limits for password have been removed. A warning is displayed though, if non–ASCII chars are used. 

----

[7.0.21] - 2017-12-19
=====================

Added
-----

* We now provide mercurial.
* You can use :ref:`additional mailboxes <mailboxes>`.
* In addition to ``$USER@uber.space``, you can now also receive mails for ``$MAILBOX@$USER.uber.space``.
* We now provide :ref:`.NET <dotnet>`.
* When you log into an Uberspace 7 server, you are now presented with the current version as well as a couple of useful links.

Fixed
-----

* We now support HTTPS connections form android phones running a version between 7.0 and 7.1.1.

----

[7.0.20] - 2017-12-08
=====================

Added
-----

* We now support maildrop, which enables you to apply advanced filtering to incoming mails.
* Common errors like configuring the permissions on your home directory to be too open are now detected and corrected silently. A notification mechanism will be added later.

Changed
-------

* Domains without explicit NS-Records were not able to receive emails. We now ask for SOA instead. 

Fixed
-----

* An erroneous systemd configuration caused the mail service to quit when it was reloaded during manual intervention. The configuration has been updated to state that the service does not support reloads.

----

[7.0.19] - 2017-11-30
=====================

Added
-----

* We now provide the ImageMagick and GraphicsMagick library
* We now provide the `imagick` pecl module in all PHP versions
* We now provide PHP 7.2 
* Due to high demand pseudo DocumentRoots are back again
* ``~/bin`` directory
  
Changed
-------

* ``PHP_INI_SCAN_DIR`` now includes files from ``/home/{USER}/etc/php.d`` first to support ioncube

----

[7.0.18] - 2017-11-18
=====================

Added
-----

* We now provide nodeJS 6, 8 and 9.


----

[7.0.17] - 2017-11-17
=====================

Fixed
-----

* ``git`` commands from non ``git-core`` now work as well.

----

[7.0.16] - 2017-11-17
=====================

Added
-----

* We now provide PHP 7.2 Release Candidates.

Fixed
-----

* New `Let's Encrypt license <https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf>`_ lead to a few cases, where the automatic certificate retrieval did not work. We now accept the latest license.

----

[7.0.15] - 2017-11-14
=====================

Added
-----

* Error logging for ``.htaccess`` files can be enabled now.


Fixed
-----

* The ``uberspace`` command now always uses the python provided by the system.

----

[7.0.14] - 2017-10-10
=====================

Added
-----

* We now provide ``zsh``.
* Our brand new ``uberspace`` command.

Changed
-------

* We replaced ``user.server.uberspace.de`` with ``user.uber.space`` in the webserver config.
* We migrated all ``uberspace-*-*`` tools to the new ``uberspace`` command.
* The ``max_allowed_packet`` setting for MySQL is ``16777216`` now to allow importing large database dumps.

Fixed
-----

* ``uberspace web domain list`` now includes ``user.uber.space``.
*  We did not apply the MySQL config file properly, therefore ``innodb_file_format`` was not set. It is ``Barracuda`` now.

----

[7.0.13] - 2017-10-05
=====================

Changed
-------

* Webserver: Several users ran into ``429`` errors. We removed the connection limits for now and will look into that later. 

Fixed
-----

* Apache and PHP: ``ProxyPassMatch`` directives are evaluated first, this brings several problems: for instance ``.htaccess`` files can't be evaluated anymore before the PHP scripts are run. Using ``FilesMatch`` and ``SetHandler`` solves the issue.
  
----

[7.0.12] - 2017-10-03
=====================

Added
-----

* 🎉 `Public Beta! <https://blog.uberspace.de/wip-die-u7-public-beta/>`_ 🎉
* The Dashboard can now talk to the Uberspace 7 servers, create users, delete users and change passwords.
* We now provide ``lynx``, ``w3m`` and ``bind-utils``.
* New PHP extensions: ``soap`` and ``posix``, ``shmop``, ``sysvmsg``, ``sysvsem`` and ``sysvshm``.

Changed
-------

* We increased the maximum concurrent webserver connections from each IP address to 15 with a burst of 150 for a short period to be within the `HTTP/2 <https://stackoverflow.com/questions/39759054/how-many-concurrent-requests-should-we-multiplex-in-http-2/39761194#39761194>`_ specification.
* The webmail interface used to be reachable via ``webmail.servername.uberspace.de`` and we got the certificates from Let's Encrypt. Unfortunatelly we ran into the `rate limiting <https://letsencrypt.org/docs/rate-limits/>`_ and can't get any certificates for ``uberspace.de`` anymore. For now we had to disable the webmail interface and we will look into the issus to find a workaround. On the bright side we had to refactor the certificate deployment process and so far it's rock solid 💪😎.
* We did some work on the manual: 💄

Fixed
-----

* Composer sees that ``/bin/php`` is a symlink and directly calls the symlink target instead of ``/bin/php``. The result was that our wrapper doesn't know it's supposed to execute php. Using a hardlink instead of a symlink fixed it.
* ``something.uber.space`` can't be added via ``uberspace-add-domain`` anymore.
* HTTP basic auth headers are now passed to PHP.
* Adding a domain to the email configuration didn't trigger a qmail reload. 

----

[7.0.11] - 2017-09-21
=====================

Added
-----

* ``$user.uber.space``-domains in addition to ``$user.server.uberspace.de``-domains.

Changed
-------

* Webserver logs are now stored in ``~/logs/webserver``

----

[7.0.10] - 2017-08-17
=====================

Added
-----

* We now have a webmail interface.
* Users are now able to provide their own ``php.ini`` files that are loaded in addition to the stock config.
* Incoming mails are filtered with the ``ix.dnsbl.manitu.net`` and ``bl.spamcop.net`` blacklists to reduce SPAM.

----

[7.0.9] - 2017-08-02
=====================

Added
-----

* ``access_log`` and ``error_log`` can be enabled and disabled now.

Changed
-------

* We are using the newest MySQL file format `Barracuda <https://mariadb.com/kb/en/mariadb/xtradbinnodb-file-format/>`_.
* We are now using ``utf8mb4`` by default in MariaDB.
* ``access_log`` and ``error_log`` are disabled by default.
* We adapted php.ini settings for common CMSes: drupal, Typo3, Magento, owncloud

Fixed
-----

* Websocket proxy connections can divert random requests. It is not known what exactly causes apache to do this, but we strongly suspect a bug. For now the fix is deactivating ``mod_proxy_wstunnel`` for the connections to Apache.
* A graceful restart in Apache causes it to not accept any new requests until all old requests have been finished. This causes the server to be unresponsive for an undefined amount of time in some cases. We now set ``GracefulShutDownTimeout 5`` in the Apache config.

----

[7.0.8.1] - 2017-07-13
=====================

Added
-----

* The changelog is now linked in the sidebar navigation.
* We provide ``git`` version 2 from `IUS repo <https://ius.io/GettingStarted/>`_.
* We now set ``session.use_strict_mode = 1`` in global ``php.ini`` to combat session fixation attacks.

Fixed
-----

* nginx and php log errors to different files now.
* php session files are getting cleaned up now.
* We changed our ``ssl_ciphers`` to make it possible for ``java8`` to connect via HTTPS.
* Apache does not parse IP addresses in ``x-forwarded-for`` headers correctly, this is a bug in `mod_rpaf <https://github.com/gnif/mod_rpaf/pull/45>`_. To work around that we disabled ``keepalive`` between Apache<=>nginx (not nginx<=>users) for now.
* Many connections to a single virtualhost can shut down the whole webserver. We now rate-limit the maximum connections for each user.

----

[7.0.8] - 2017-06-26
=====================

Added
-----

* In the past the maximum upload size for PHP was chaos. We now guarantee 500 megabytes everywhere.
* We now ship Python 3. You can choose from interpreter versions 3.4, 3.5, as well as 3.6.
* We now provide midnight commander.
* Following security best practices, we now set a number of HTTP headers.

Fixed
-----

* The version system did not respect the selected version, when executed with ``nice`` or within a cronjob. To fix this, we no longer modify the ``$PATH``, but instead use wrapper scripts.
* To comply with German privacy regulations all IP addresses within user-accessible webserver logs are now shortened.
* As to not unnecessarily leak software versions, we now remove the ``X-Powered-By`` header from all HTTP responses.
* To prevent unexpected behaviour, mice are now banned from using nano. 🐭🚫

Backstage
---------

* We've upgraded all ``uberspace-`` scripts to [paternoster v2](github.com/uberspace/paternoster).
* Since ``te512042.019e71729061e1f03aef698f89da225d00559bbd-1310.testing.ubrspc.de`` is not a very handy hostname, we now use shorter ones like ``565743.vagrant.ubrspc.de`` within our testing setup.
* Nginx rightly complained about a duplicated MIME type in our config. We learned that ``text/html`` is implied, so we no longer add it to the list of gzip-able files explictly.
* A `bug within vagrant-google <https://github.com/mitchellh/vagrant-google/issues/159>`_ caused our workflows to be a bit cumbersome. So we `fixed it <https://github.com/mitchellh/vagrant-google/pull/167>`_.
* An oversight caused us to issue certificates with non-unique serial numbers during testing. While those certificates never reached production, they're more random now.

----

[7.0.6.2] - 2017-05-03
=====================

Added
-----

* we say goodbye to ``daemontools`` and hello to ``supervisord``! For the impatient:
  * setup daemons in ``~/etc/services.d/``, create a ``*.ini`` file for `each daemon <http://supervisord.org/running.html#adding-a-program)>`_
  * control deamons with `supervisorctl status <http://supervisord.org/running.html#running-supervisorctl>`_.
  * see logs in ``~/logs/``
  * check the global config if you're curious: ``/etc/supervisord.conf``
  * check the `official documentation <http://supervisord.org>`_

----

[7.0.6] - 2017-04-25
=====================

Added
-----

* redirect HTTP requests to HTTPS
* adapt ``$PATH`` to prioritize home bin: ``PATH=$HOME/.local/bin:$HOME/bin:$PATH``
* implement option to change shell via ``chsh`` without password
* provide PHP module: ``bcmath``

Fixed
-----

* some of the ``uberspace-*`` scripts were horribly slow. This is due to the fact that the scripts are written in Ansible and the loading of modules and fact gathering takes time. With the recent changes in we're down to <5s for each script.
* fix for webserver sometimes delivering the wrong certificate

----

[7.0.5] - 2017-04-03
=====================

Added
-----

* provide ``libunwind``, ``libicu``, ``screen``, ``ncdu``
* provide PHP modules: ``pecl-zip``, ``pecl-apcu``, ``mcrypt``, ``mbstring``, ``intl``, ``xml``, ``json``, ``tidy``, ``gd``, ``mysqlnd``, ``pgsql``, ``imap``

Fixed
-----

* ``uberspace-add-domain -v`` leaked all user names and corresponding domains.

----

[7.0.4] - 2017-03-16
=====================

Added
-----

* relay mail via SMTP
* provide symlink ``~/html`` for convenience

----

[7.0.3] - 2017-03-03
=====================

Added
-----

* PHP 7.1

Changed
-------

* make PHP 7.1 standard

----

[7.0.2] - 2017-02-10
=====================

Added
-----

* own domains with mailserver via ``uberspace-add-domain -m``
* access mail via IMAP and POP3

----

[7.0.1] - 2017-01-20
=====================

Fixed
-----

* Cleanup

----

The format is based on `Keep a Changelog <http://keepachangelog.com/>`_.
and this project adheres to `Semantic Versioning <http://semver.org/>`_.
