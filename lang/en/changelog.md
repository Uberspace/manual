# Changes in Uberspace 7
This document will track major changes in the project.

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
