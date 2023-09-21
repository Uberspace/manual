##############
Home Directory
##############

Your home directory is your own, private directory on the Uberspace host. It is a directory with the same name as your user account, stored within the ``/home`` directory. So if your Uberspace account is named ``isabell``, you home directory is ``/home/isabell``.

What Should I Put Here?
=========================

The general rule is: Anything you don't want anyone else to see, especially any files you don't want to be accessible by the web server.

Default Files and Folders
=========================

~/.bash*
--------

The ``.bash_profile``, ``.bashrc`` and ``.bash_logout`` files are the configuration, startup and logout scripts for the :doc:`Bash Shell <basics-shell>`. ``.bash_profile`` is a script that is executed when you log in via :doc:`ssh <basics-ssh>` and will include ``.bashrc``. If you want to run any commands automatically whenever you log in, add them to ``.bash_profile``. ``.bash_logout`` is executed when you log out. After your first login, ``.bash_history`` will be added automatically and logs all you shell commands so you can re-run them later.

In many contexts, the tilde ``~`` can be used as a placeholder for your home directory.

~/bin
-----

Within the ``bin`` directory executables installed by custom tools or written by yourself can be stored. They can then be called like normal commands.

~/etc
-----

The ``etc`` folder is reserved for configuration files of any kind:

    - ``etc/certificates`` shows your certificate files for :doc:`https <web-https>`.
    - ``etc/php.d`` contains your custom configuration files for your :ref:`php <php-custom-configuration>`.
    - ``etc/services.d`` contains the configuration files for your :doc:`services <daemons-supervisord>`.
    - ``etc/userfacts`` shows your userfacts where we store specific Uberspace configurations.

~/html
------

``html`` is a symbolic link to your :doc:`documentroot <web-documentroot>`. Anything in there is accessible to the web server, and thus to the public.

~/logs
------

A directory to store log files.

~/Maildir
---------

This is the mailbox for your system mail ``username@uber.space``. By default this email address just forwards to your personal registration mail address and you dont need `~/Maildir`.

~/.maillimit
------------

We will automatically add files here when using `sendmail` to ratelimit the email sending.

~/.my.cnf
---------

This is your :doc:`mysql <database-mysql>` settings file.

~/users
-------

Your additional :doc:`mailboxes <mail-mailboxes>`. This folder only exists if you set up mailboxes with ``uberspace mail user add``.

~/.passwd.cdb
-------------

The configuration db (binary) for your mailboxes, this will be added with your first additional :doc:`mailboxes <mail-mailboxes>` and controlled by the mail system.

~/.qmail
--------

The ``.qmail`` file controls your ``username@uber.space`` system mailaddress and forwards mails to the registration mailaddress.

~/.qmail-*
----------

``.qmail-*`` files (“dotqmail files”) are used to add email aliases or forwarding addresses. Instead of using those file you should use :doc:`mailboxes <mail-mailboxes>`.

~/.spamfolder
-------------

Despite the historical name, this file includes scripts not only to handle incoming spam but also to use :doc:`SIEVE <mail-filters>` and :doc:`plussed mailaddresses <mail-mailboxes>` etc.

~/.ssh
------

The ``.ssh`` directory contains your :doc:`ssh <basics-ssh>` configuration.

~/tmp
-----

A directory for temporary files.

~/.zshrc
--------

The configuration file for the :doc:`Z Shell <basics-shell>`.
