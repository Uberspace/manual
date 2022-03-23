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

  [isabell@stardust ~]$ my_print_defaults client
  --default-character-set=utf8mb4
  --user=isabell
  --password=SomeStrongPassword


Changing your password
----------------------

Your password can be changed with the `SET PASSWORD <https://mariadb.com/kb/en/mariadb/set-password/>`_ SQL statement.
Tools like Adminer or phpMyAdmin provide you with a web-based way of doing that (if you installed them), but it can easily be done on the shell as well:

.. code-block:: console

  [isabell@stardust ~]$ mysql -e "SET PASSWORD = PASSWORD('YourNewPassword')"

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

  [isabell@stardust ~]$ my_print_defaults clientreadonly
  --user=isabell_ro
  --password=SomeOtherStrongPassword

Unfortunately you cannot change the password of the read-only user yourself (it's read-only!).
If you really need to change it, please contact hallo@uberspace.de.


Additional databases
====================

In addition to the default database named like your Uberspace you can also create an unlimited number of additional databases
prefixed with your username and ``_`` - if your username is ``isabell`` you can create databases named like ``isabell_blog``, ``isabell_shop``.

New databases can be created with the `CREATE DATABASE <https://mariadb.com/kb/en/mariadb/create-database/>`_ SQL statement.
Tools like Adminer or phpMyAdmin provide you with a web-based way of doing that (if you installed them), but it can easily done on the shell as well:

.. code-block:: console

  [isabell@stardust ~]$ mysql -e "CREATE DATABASE isabell_blog"

If you don't see any output, it's a good thing; MariaDB only complains if something went wrong.

You can list your additional databases using the `SHOW DATABASES <https://mariadb.com/kb/en/show-databases/>`_ SQL statement:

.. code-block:: console

  [isabell@stardust ~]$ mysql -e "SHOW DATABASES"
  +--------------------+
  | Database           |
  +--------------------+
  | information_schema |
  | isabell              |
  | isabell_gitea        |
  | isabell_shopware6    |
  +--------------------+

To remove databases, use the `DROP DATABASE <https://mariadb.com/kb/en/mariadb/drop-database/>`_ SQL statement:

.. code-block:: console

  [isabell@stardust ~]$ mysql -e "DROP DATABASE isabell_blog"

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

  [isabell@stardust ~]$ mysqldump isabell > isabell.sql

This command dumps all tables of the ``isabell`` database at once. If you just want to dump a single or a few tables, put their names behind the database name:

.. code-block:: console

  [isabell@stardust ~]$ mysqldump isabell table1 > isabell.table1.sql
  [isabell@stardust ~]$ mysqldump isabell table2 table3 > isabell.table2and3.sql

As the resulting files are plain text files (remember, they are just a bunch of SQL statements) you can easily compress them on the fly, e.g. with ``xz``:

.. code-block:: console

  [isabell@stardust ~]$ mysqldump isabell | xz > isabell.sql.xz


Importing dumps
---------------

As dumps are just files containing SQL statements you can feed them into the ``mysql`` command, importing them into a database of your choice.
For example, to import the dump named ``isabell.sql`` into your database ``isabell`` (overwriting existing tables, if any):

.. code-block:: console

  [isabell@stardust ~]$ mysql isabell < isabell.sql

Or in case of a compressed dump, use ``xzcat`` to uncompress the data before feeding it into MariaDB:

.. code-block:: console

  [isabell@stardust ~]$ xzcat isabell.sql.xz | mysql isabell


Streaming dumps
---------------

In case you want to copy a database into another one, or from one running MySQL or MariaDB host to another, there's no need to write the dump into a file at all.
Given that you already created a database named ``isabell_copy`` you can copy all data from ``isabell`` over to your new database:

.. code-block:: console

  [isabell@stardust ~]$ mysqldump isabell | mysql isabell_copy

This will also work over SSH - for example to dump a database on some other host you're having shell access to as well, this is what you're able to do to import all tables of a remote database named ``otherdatabase`` into your local database ``isabell`` (overwriting existing tables, if any):

.. code-block:: console

  [isabell@stardust ~]$ ssh otheruser@some.other.host mysqldump otherdatabase | mysql isabell


Monitoring and analysing sql queries
====================================

You can use the tool ``mtop`` to monitor and analyse your mysql queries easily. You will need to provide your credentials:

.. code-block:: console

  [isabell@stardust ~]$ mtop -dbu $USER -p <MYSQL_PASSWORD>

Alternatively you can create a configuration file ``~/.mtoprc`` and insert your credentials there:

.. code-block::

  --dbuser=isabell
  --password=<MYSQL_PASSWORD>

You can then just use the command ``mtop`` to start the tool.


Custom settings
===============

UTF-8
-----

The default encoding for MySQL is still ``latin-1``, which can cause a lot of problems if you typically use Unicode characters and forget to explicitly set the encoding to UTF-8 every time. Therefore, we changed the default encoding to ``utf8mb4``, which enables you to use all ``UTF-8`` characters, including emojis 😊.


External connection
===================

For security reasons we don't allow external connections to your databases.
However, if you want to connect somehow "directly" from a remote host, you can do so by using a SSH tunnel.

This is how you can initiate a SSH connection offering a tunnel for the mysql port ``3306``:

.. code-block:: console

  localuser@localhost ~ $ ssh isabell@stardust.uberspace.de -L 3306:127.0.0.1:3306

From now on, you can talk to ``127.0.0.1:3306`` on your local host to connect to your database.
(While in fact, it's OpenSSH listening on port ``3306`` of your local host, tunneling the connection to your Uberspace.)


.. tip::

   When using Windows 8.1 or any other not up-to-date versions of Windows, you will most probably not be able to use SSH as natively as shown here.
   You will either need to update to a more recent version of Windows or use our `howto for Putty DB connection <https://lab.uberspace.de/howto_ssh-putty.html#connect-via-putty-ssh-tunnel-to-mysql>`_
   instead of the commands used here.