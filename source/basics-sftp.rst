.. _sftp:

####
SFTP
####

The *Secure File Transfer Protocol* is an encrypted protocol to exchange files between two computers, e.g. your own computer and the Uberspace host.

Since SFTP is based on SSH, you can use the SSH :ref:`ssh-login-data`.

Clients
=======

* `Cyberduck <https://cyberduck.io/>`_, a macOS and Windows client.
* `FileZilla <https://filezilla-project.org>`_, a multi-platform client available for Windows, Linux and macOS.
* `WinSCP <https://winscp.net/>`_, a Windows-only client.

.. tip:: FTP is an outdated protocol that does not use encryption in its standard implementation. While there are implementations such as FTP over SSL (FTPS), we believe that using a more modern protocol is the better choice.

.. include:: includes/sftp-warning.rst
