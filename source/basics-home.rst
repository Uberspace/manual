.. _home:

##############
Home Directory
##############

Your home directory is your own, private directory on the Uberspace host. It is a directory with the same name as your user account, stored within the ``/home`` directory. So if your Uberspace account is named ``isabell``, you home directory is ``/home/isabell``. 

What Should I Put Here?
=========================

The general rule is: Anything you don't want anyone else to see, especially any files you don't want to be accessible by the web server. 

Default Files and Folders
=========================

.bash*
------

The ``.bash_profile``, ``.bashrc`` and ``.bash_logout`` files are the configuration, startup and logout scripts for the :ref:`Bash Shell <shell>`. ``.bash_profile`` is a script that is executed when you log in via :ref:`ssh` and will include ``.bashrc``. If you want to run any commands automatically whenever you log in, add them to ``.bash_profile``. ``.bash_logout`` is executed when you log out. After your first login, ``.bash_history`` will be added automatically and logs all you shell commands so you can re-run them later.

In many contexts, the tilde ``~`` can be used as a placeholder for your home directory.

etc
---

The ``etc`` folder is reserved for configuration files of any kind: 

    - ``etc/certificates`` shows your certificate files for :ref:`https <web-https>`.
    - ``etc/php.d`` contains your custom configuration files for your :ref:`php <php-custom-configuration>`.
    - ``etc/services.d`` contains the configuration files for your :ref:`services <supervisord>`.
    - ``etc/userfacts`` shows your userfacts where we store specific Uberspace configurations.

bin
---

Within the ``bin`` directory executables installed by custom tools or written by yourself can be stored. They can then be called like normal commands.

html
----

``html`` is a symbolic link to your :ref:`documentroot`. Anything in there is accessible to the web server, and thus to the public.

logs
----

A directory to store log files. 

Maildir
-------

Your emails and IMAP folders are stored in this directory.


users
-----

Your additional :ref:`mailboxes`. This folder only exists if you set up mailboxes with ``uberspace mail user add``.

.my.cnf
-------

This is your :ref:`mysql` settings file.

.qmail*
-------

``.qmail`` files (“dotqmail files”) are used to add email aliases or forwarding addresses.

.ssh
----

The ``.ssh`` directory contains your :ref:`ssh` configuration.

tmp
---

A directory for temporary files.

.zshrc
------

The configuration file for the :ref:`Z Shell <shell>`.
