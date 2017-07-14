####
SFTP
####

The *Secure File Transfer Protocol* is an encrypted protocol to exchange files between two computers, e.g. your own computer and the Uberspace host. 

Since SFTP is based on SSH, you can use the same `login data <basics-ssh#login-data>`_.

What About FTP?
===============

FTP is an outdated protocol that does not use encryption in its standard implementation. While there are implementations such as FTP over SSL (FTPS), we believe that using a more modern protocol is the better choice.

SFTP Clients
============

* `Cyberduck <https://cyberduck.io/>`_, a macOS and Windows client.
* `FileZilla <https://filezilla-project.org>`_, a multi-platform client available for Windows, Linux and macOS.
* `WinSCP <https://winscp.net/>`_, a Windows-only client.

⚠️ SSH commands
==============

Some SFTP clients offer rudimentary “shells” to run commands on the server via SSH. While this may work for some non-interactive commands, it can cause problems when using interactive tools and other commands. We generally recommend to use a full-featured `SSH <ssh.html>`_ client to run commands on the server.