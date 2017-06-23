# Changes in Uberspace 7
This document will track major changes in the project.

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
