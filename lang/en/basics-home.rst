##############
Home Directory
##############

Your home directory is you own, private directory on the Uberspace host. It is a directory with the same name as your user account, stored within the `/home` directory. So if your Uberspace account is named `eliza`, you home directory is `/home/eliza`. 

What Should I Put Here?
=========================

The general rule is: Anything you don't want anyone else to see, especially any files you don't want to be accessible by the web server. 

Default Files and Folders
=========================

.bash*
------

The `.bash_profile`, `.bashrc` and `.bash_logout` files are the configuration, startup and logout scripts for the `Bash shell <basics-shell>`_. `.bash_profile` is a script that is executed when you log in via `SSH <basics-ssh>`_ and will include `.bashrc`. If you want to run any commands automatically whenever you log in, add them to `.bash_profile`. `.bash_logout` is executed when you log out. After your first login, `.bash_history` will be added automatically and logs all you shell commands so you can re-run them later.

In many contexts, the tilde `~` can be used as a placeholder for your home directory.

.emacs
------

The `.emacs` file is the configuration for the `emacs` editor. 

etc
---

The `etc` folder is reserved for configuration files of any kind. Most importantly, this includes your `supervisord <daemons-supervisord>`_ configuration in `etc/services.d`.

html
----

`html` is a symbolic link to your `document root <web-documentroot>`_. Anything in there is accessible to the web server, and thus to the public.

logs
----



Maildir
-------



.my.cnf
-------



.qmail*
-------



.ssh
----



tmp
---



.zshrc
------