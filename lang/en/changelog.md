# Changes in Uberspace 7
This document will track major changes in the project.

## [7.0.10] - 2017-08-17

### Added
* We now have a webmail interface.
* Users are now able to provide their own `php.ini` files that are loaded in addition to the stock config.
* Incoming mails are filtered with the `ix.dnsbl.manitu.net` and `bl.spamcop.net` blacklists to reduce SPAM.

## [7.0.9] - 2017-08-02

### Added
* `access_log` and `error_log` can be enabled and disabled now.

### Changed
* We are using the newest MySQL file format [Barracuda](https://mariadb.com/kb/en/mariadb/xtradbinnodb-file-format/).
* We are now using `utf8mb4` by default in MariaDB.
* `access_log` and `error_log` are disabled by default.
* We adapted php.ini settings for common CMSes: drupal, Typo3, Magento, owncloud

### Fixed
* Websocket proxy connections can divert random requests. It is not known what exactly causes apache to do this, but we strongly suspect a bug. For now the fix is deactivating `mod_proxy_wstunnel` for the connections to Apache.
* A graceful restart in Apache causes it to not accept any new requests until all old requests have been finished. This causes the server to be unresponsive for an undefined amount of time in some cases. We now set `GracefulShutDownTimeout 5` in the Apache config.

## [7.0.8.1] - 2017-07-13

### Added
* The changelog is now linked in the sidebar navigation.
* We provide `git` version 2 from [IUS repo](https://ius.io/GettingStarted/).
* We now set `session.use_strict_mode = 1` in global `php.ini` to combat session fixation attacks.

### Fixed
* nginx and php log errors to different files now.
* php session files are getting cleaned up now.
* We changed our `ssl_ciphers` to make it possible for `java8` to connect via HTTPS.
* Apache does not parse IP addresses in `x-forwarded-for` headers correctly, this is a bug in [mod_rpaf](https://github.com/gnif/mod_rpaf/pull/45). To work around that we disabled `keepalive` between Apache<=>nginx (not nginx<=>users) for now.
* Many connections to a single virtualhost can shut down the whole webserver. We now rate-limit the maximum connections for each user.

## [7.0.8] - 2017-06-26

### Added

* In the past the maximum upload size for PHP was chaos. We now guarantee 500 megabytes everywhere.
* We now ship Python 3. You can choose from interpreter versions 3.4, 3.5, as well as 3.6.
* We now provide midnight commander.
* Following security best practices, we now set a number of HTTP headers.

### Fixed

* The version system did not respect the selected version, when executed with `nice` or within a cronjob. To fix this, we no longer modify the `$PATH`, but instead use wrapper scripts.
* To comply with German privacy regulations all IP addresses within user-accessible webserver logs are now shortened.
* As to not unnecessarily leak software versions, we now remove the `X-Powered-By` header from all HTTP responses.
* To prevent unexpected behaviour, mice are now banned from using nano. 🐭🚫

### Backstage

* We've upgraded all `uberspace-` scripts to [paternoster v2](github.com/uberspace/paternoster).
* Since `te512042.019e71729061e1f03aef698f89da225d00559bbd-1310.testing.ubrspc.de` is not a very handy hostname, we now use shorter ones like `565743.vagrant.ubrspc.de` within our testing setup.
* Nginx rightly complained about a duplicated MIME type in our config. We learned that `text/html` is implied, so we no longer add it to the list of gzip-able files explictly.
* A [bug within `vagrant-google`](https://github.com/mitchellh/vagrant-google/issues/159) caused our workflows to be a bit cumbersome. So we [fixed it](https://github.com/mitchellh/vagrant-google/pull/167).
* An oversight caused us to issue certificates with non-unique serial numbers during testing. While those certificates never reached production, they're more random now.

## [7.0.6.2] - 2017-05-03
### Added
* we say goodbye to `daemontools` and hello to `supervisord`! For the impatient:
  * setup daemons in `~/etc/services.d/`, create a `*.ini` file for [each daemon](http://supervisord.org/running.html#adding-a-program)
  * control deamons with [`supervisorctl status`](http://supervisord.org/running.html#running-supervisorctl).
  * see logs in `~/logs/`
  * check the global config if you're curious: `/etc/supervisord.conf`
  * check the [official documentation](http://supervisord.org)

## [7.0.6] - 2017-04-25
### Added
* redirect HTTP requests to HTTPS
* adapt `$PATH` to prioritize home bin: `PATH=$HOME/.local/bin:$HOME/bin:$PATH`
* implement option to change shell via `chsh` without password
* provide PHP module: `bcmath`

### Fixed
* some of the `uberspace-*` scripts were horribly slow. This is due to the fact that the scripts are written in Ansible and the loading of modules and fact gathering takes time. With the recent changes in we're down to <5s for each script.
* fix for webserver sometimes delivering the wrong certificate

## [7.0.5] - 2017-04-03
### Added

* provide `libunwind`, `libicu`, `screen`, `ncdu`
* provide PHP modules: `pecl-zip`, `pecl-apcu`, `mcrypt`, `mbstring`, `intl`, `xml`, `json`, `tidy`, `gd`, `mysqlnd`, `pgsql`, `imap`

### Fixed
* `uberspace-add-domain -v` leaked all user names and corresponding domains.

## [7.0.4] - 2017-03-16
### Added
* relay mail via SMTP
* provide symlink `~/html` for convenience

## [7.0.3] - 2017-03-03
### Added
* PHP 7.1

### Changed
* make PHP 7.1 standard

## [7.0.2] - 2017-02-10
### Added
* own domains with mailserver via `uberspace-add-domain -m`
* access mail via IMAP and POP3

## [7.0.1] - 2017-01-20
### Fixed
* Cleanup
------------

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).
