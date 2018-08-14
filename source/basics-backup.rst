.. _backup:

######
Backup
######

We automatically back up your files to another server every night.

.. warning:: We strongly recommend that you do not rely solely on our backup. Keep a backup of your own at another location.

Files
=====

We keep daily backups of the last seven days, and weekly backups going back seven weeks.

Restoring from the backup
=========================

You can access your host's backup at ``/backup``: 

.. code-block:: console

  [eliza@doolittle ~]# ls -l /backup/
  total 56
  dr-xr-xr-x. 19 root root 4096 Jul 30 22:29 current
  lrwxrwxrwx.  1 root root    7 May 30 22:10 daily.0 -> current
  dr-xr-xr-x. 19 root root 4096 Jul 30 22:29 daily.1
  dr-xr-xr-x. 19 root root 4096 Jul 30 01:57 daily.2
  lrwxrwxrwx.  1 root root    8 Jul 29 15:21 daily.3 -> weekly.1
  dr-xr-xr-x. 19 root root 4096 Jul 27 22:19 daily.4
  dr-xr-xr-x. 19 root root 4096 Jul 26 22:14 daily.5
  dr-xr-xr-x. 18 root root 4096 Jul 25 22:13 daily.6
  dr-xr-xr-x. 18 root root 4096 Jul 24 22:12 daily.7
  dr-xr-xr-x. 19 root root 4096 Jul 29 11:09 weekly.1
  dr-xr-xr-x. 17 root root 4096 Jul 22 22:11 weekly.2
  dr-xr-xr-x. 17 root root 4096 Jul 15 22:11 weekly.3
  dr-xr-xr-x. 17 root root 4096 Jul  8 22:10 weekly.4
  dr-xr-xr-x. 17 root root 4096 Jul  1 22:10 weekly.5
  dr-xr-xr-x. 17 root root 4096 Jun 24 22:10 weekly.6
  dr-xr-xr-x. 17 root root 4096 Jun 17 22:10 weekly.7

Let's say you accidentally deleted the folder ``/var/www/virtual/eliza/html/blog`` three days ago. No problem, there is a complete backup at ``/backup/daily.3/var/www/virtual/eliza/html/blog``:

.. code-block:: console

  [eliza@doolittle ~]$ ls -ld /backup/daily.3/var/www/virtual/eliza/html/blog
  drwxr-xr-x 12 eliza eliza 4096 Jul 28 23:31 /backup/daily.3/var/www/virtual/eliza/html/blog


You can use standard Linux commands such as ``ls``, ``cp``, ``rsync``, etc. to look around and restore files and folders from the backup. ``rsync`` lets you do a dry run first which won't modify anything yet:

.. code-block:: console

  [eliza@doolittle ~]$ rsync --dry-run --verbose --recursive --links --perms --times --hard-links --acls --xattrs /backup/daily.3/var/www/virtual/eliza/html/blog/ /var/www/virtual/eliza/html/blog/

If the output of your dry run looks good, you can restore the backup:

.. code-block:: console

  [eliza@doolittle ~]$ rsync --verbose --recursive --links --perms --times --hard-links --acls --xattrs /backup/daily.3/var/www/virtual/eliza/html/blog/ /var/www/virtual/eliza/html/blog/

.. note:: Because the backup is mounted as an NFS share, it has a different `SELinux` context than your target directory. To avoid permission problems, run ``restorecon -R`` on your restored data, e.g. ``restorecon -R /var/www/virtual/eliza/html/blog/``.

If you need help, don't hesitate to contact us at hallo@uberspace.de.

.. warning:: Do not use symlinks such as ``~/html`` when restoring your backup – that won't work because the backed-up symlink still points to the actual target ``/var/www/virtual/$USER/html`` instead of the target's backup (``/backup/daily.3/var/www/virtual/$USER/html``).
