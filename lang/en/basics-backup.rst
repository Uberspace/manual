.. _backup:

######
Backup
######

We automatically back up your files and :ref:`MySQL` databases to another server every night.

.. warning:: We strongly recommend that you do not rely solely on our backup. Keep a backup of your own at another location.

Files
=====

We keep daily backups of the last seven days, and weekly backups going back seven weeks.

MySQL databases
===============

Since MySQL dumps can't be created incrementally, we cannot provide seven weeks of backups, but we keep the last twelve days of MySQL dumps.

Restoring from the backup
=========================

If you need to restore files or need a MySQL dump from the backup, please contact `hallo@uberspace.de <mailto:hallo@uberspace.de>`_. Please include the following information in your email:

- the path to the file(s) / folder(s) you need restored `or`
- the name of the MySQL database for which you require a dump
- the date of the backup you want to restore
- your username