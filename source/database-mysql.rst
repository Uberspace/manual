.. _mysql:

#####
MySQL
#####

We're providing MariaDB 10.3 as a MySQL-compatible database server.
If you're already used to use MySQL, you can lean back calmly:
To avoid confusion, MariaDB uses the same command names you already know, like ``mysql``, ``mysqldump`` etc. - just use them as usual.

Our default setup provides you with a database and a user named like your Uberspace, but you can create additional databases later.

Webinterface
============

You can manage your databases via `phpMyAdmin <https://mysql.uberspace.de/phpmyadmin/>`_ or `adminer <https://mysql.uberspace.de/adminer/>`_.

Login credentials
=================

Applications based on MySQL databases will ask you for a username, a password, a database name and possibly a host/port.

+-----------+----------------------------------+
| Username  | *equals your Uberspace username* |
+-----------+----------------------------------+
| Password  | *see below*                      |
+-----------+----------------------------------+
| Database  | *equals your Uberspace username* |
+-----------+----------------------------------+
| Host/Port | localhost                        |
+-----------+----------------------------------+

Your MySQL password differs from any other password.
We've created a strong one and put it into the file ``~/.my.cnf`` which is used by the MariaDB command-line tools to automatically log you in.
Take a look into that file or execute ``my_print_defaults client`` to show it, like that:

.. code-block:: console

  [eliza@dolittle ~]$ my_print_defaults client
  --default-character-set=utf8mb4
  --user=eliza
  --password=SomeStrongPassword


Changing your password
----------------------

Your password can be changed with the `SET PASSWORD <https://mariadb.com/kb/en/mariadb/set-password/>`_ SQL statement.
Tools like Adminer or phpMyAdmin provide you with a web-based way of doing that (if you installed them), but it can easily be done on the shell as well:

.. code-block:: console

  [eliza@dolittle ~]$ mysql -e "SET PASSWORD = PASSWORD('YourNewPassword')"

If you don't see any output, it's a good thing; MariaDB only complains if something went wrong.

.. warning ::
  It is very important to put the new password into your ``~/.my.cnf`` file with a text editor of your choice.
  That way, MariaDB command-line tools are still able to automatically log you in.

Password Requirements
~~~~~~~~~~~~~~~~~~~~~

We generate a passwords for you on user creation. It consists of 20 random characters, containing a mix of upper and lowercase ASCII letters, the numbers 0-9 and punctuation (``.,:-_``).

But we only *enforce the following rules*, if you want to set your own:

- A minimal length of 16 characters.


Read-only user
--------------

While most applications based on MySQL databases support exactly one database user (and expect it to have write permissions),
there are use cases for a read-only user as well, especially from a security perspective.
We provide you with a separate user suffixed with ``_ro`` ("read-only") which you can use in these cases.
This user has a different password than the default read/write user which can also be found in your ``~/.my.cnf`` file;
you can also execute ``my_print_defaults clientreadonly`` to show it, like that:

.. code-block:: console

  [eliza@dolittle ~]$ my_print_defaults clientreadonly
  --user=eliza_ro
  --password=SomeOtherStrongPassword

Unfortunately you cannot change the password of the read-only user yourself (it's read-only!).
If you really need to change it, please contact hallo@uberspace.de.


Additional databases
====================

In addition to the default database named like your Uberspace you can also create an unlimited number of additional databases
prefixed with your username and ``_`` - if your username is ``eliza`` you can create databases named like ``eliza_blog``, ``eliza_shop``.

New databases can be created with the `CREATE DATABASE <https://mariadb.com/kb/en/mariadb/create-database/>`_ SQL statement.
Tools like Adminer or phpMyAdmin provide you with a web-based way of doing that (if you installed them), but it can easily done on the shell as well:

.. code-block:: console

  [eliza@dolittle ~]$ mysql -e "CREATE DATABASE eliza_blog"

If you don't see any output, it's a good thing; MariaDB only complains if something went wrong.

You can list your additional databases using the `SHOW DATABASES <https://mariadb.com/kb/en/show-databases/>`_ SQL statement:

.. code-block:: console

  [eliza@dolittle ~]$ mysql -e "SHOW DATABASES"
  +--------------------+
  | Database           |
  +--------------------+
  | information_schema |
  | eliza              |
  | eliza_gitea        |
  | eliza_shopware6    |
  +--------------------+

To remove databases, use the `DROP DATABASE <https://mariadb.com/kb/en/mariadb/drop-database/>`_ SQL statement:

.. code-block:: console

  [eliza@dolittle ~]$ mysql -e "DROP DATABASE eliza_blog"

If you don't see any output, it's a good thing; MariaDB only complains if something went wrong.


Working with dumps
==================

Dumps are the default way of exporting/importing databases.
You can use them as a backup or to migrate an existing database dumped on another host to your Uberspace or vice-versa. We dump all databases every day and keep them as :ref:`backup <mysql_backup>`.

Creating dumps
--------------

The ``mysqldump`` command allows you to dump tables or whole databases, represented by a bunch of SQL statements that will re-create the table structures and re-insert all data when executed.
The most common use is to redirect its output into a file, like that:

.. code-block:: console

  [eliza@dolittle ~]$ mysqldump eliza > eliza.sql

This command dumps all tables of the ``eliza`` database at once. If you just want to dump a single or a few tables, put their names behind the database name:

.. code-block:: console

  [eliza@dolittle ~]$ mysqldump eliza table1 > eliza.table1.sql
  [eliza@dolittle ~]$ mysqldump eliza table2 table3 > eliza.table2and3.sql

As the resulting files are plain text files (remember, they are just a bunch of SQL statements) you can easily compress them on the fly, e.g. with ``xz``:

.. code-block:: console

  [eliza@dolittle ~]$ mysqldump eliza | xz > eliza.sql.xz


Importing dumps
---------------

As dumps are just files containing SQL statements you can feed them into the ``mysql`` command, importing them into a database of your choice.
For example, to import the dump named ``eliza.sql`` into your database ``eliza`` (overwriting existing tables, if any):

.. code-block:: console

  [eliza@dolittle ~]$ mysql eliza < eliza.sql

Or in case of a compressed dump, use ``xzcat`` to uncompress the data before feeding it into MariaDB:

.. code-block:: console

  [eliza@dolittle ~]$ xzcat eliza.sql.xz | mysql eliza


Streaming dumps
---------------

In case you want to copy a database into another one, or from one running MySQL or MariaDB host to another, there's no need to write the dump into a file at all.
Given that you already created a database named ``eliza_copy`` you can copy all data from ``eliza`` over to your new database:

.. code-block:: console

  [eliza@dolittle ~]$ mysqldump eliza | mysql eliza_copy

This will also work over SSH - for example to dump a database on some other host you're having shell access to as well, this is what you're able to do to import all tables of a remote database named ``otherdatabase`` into your local database ``eliza`` (overwriting existing tables, if any):

.. code-block:: console

  [eliza@dolittle ~]$ ssh otheruser@some.other.host mysqldump otherdatabase | mysql eliza

Custom settings
===============

UTF-8
-----

The default encoding for MySQL is still ``latin-1``, which can cause a lot of problems if you typically use Unicode characters and forget to explicitly set the encoding to UTF-8 every time. Therefore, we changed the default encoding to ``utf8mb4``, which enables you to use all ``UTF-8`` characters, including emojis😊.


Connecting from outside
=======================

For security reasons we don't allow external connections to your databases.
However, if you want to connect somehow "directly" from a remote host, you can do so by using a SSH tunnel.


.. _mysql-ssh-tunnel-using-linux:

Using Linux, macOS, any other Unix, or Windows 10
-------------------------------------------------

On Linux, macOS and practically every other Unix operating system, as well as Windows 10 since the September 2017 “Fall Creators Update” version, `OpenSSH <https://www.openssh.com/>`_
comes preinstalled so you can use it out of the box.

This is how you can initiate a SSH connection offering a tunnel for port 3306,
your local workstation is represented by a ``[localuser@localhost ~]$`` prompt:

.. code-block:: console

  [localuser@localhost ~]$ ssh -L 3306:127.0.0.1:3306 eliza@dolittle.uberspace.de

From now on, you can talk to 127.0.0.1:3306 on your local host to connect to your database.
In fact, it's OpenSSH listening on port 3306 of your local host, tunneling the connection to your uberspace.


Using older versions of Windows
-------------------------------

Older version of Windows do not include a SSH client by default, but there are plenty of options,
`PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_ probably being the choice of most Windows users.
Other popular choices include `Git BASH <https://git-for-windows.github.io/>`_ which provides a basic shell including
the widely-used Git version control system and OpenSSH as an SSH client.
If you're looking for a large distribution of GNU and Open Source utils that feels more-or-less like a Linux distribution,
head over to `Cygwin <https://www.cygwin.com/>`_.
If you opt for one of the last two, you should better follow :ref:`mysql-ssh-tunnel-using-linux` after installation because you will then
effectively use the OpenSSH command-line utils.

As an example, here's how you setup a SSH tunnel with PuTTY:

#. Start PuTTY. The configuration dialog automatically opens.
#. Head over to "Connection | Data" in the tree menu on the left. Enter your username (``eliza`` in our example)
   into the "Auto-login username" text box.
#. Head over to "Connection | SSH | Tunnels" in the tree menu on the left.
   Enter "3306" into the "Source port:" text box, "127.0.0.1:3306" into the "Destination:" text box, and select "(o) Local".
   Click "Add" to add the tunnel.
#. Head over to "Session" in the tree menu on the left. Enter your hostname (``dolittle.uberspace.de`` in our example)
   into the "Host Name (or IP address)" text box.
   For your convenience, save these settings under a session name of your choice.
   For that, enter a description (e.g. "eliza on dolitte w/MySQL" or something like "My personal Uberspace w/MySQL") into the "Saved Sessions" text box.
   Click the "Save" button.

If you want to connect to your database, start the connection by double-clicking it to establish the SSH tunnel.

From now on, you can talk to 127.0.0.1:3306 on your local host to connect to your database.
In fact, it's PuTTY listening on port 3306 of your local host, tunneling the connection to your uberspace.
