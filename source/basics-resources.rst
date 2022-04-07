################
System Resources
################

.. _quota:

Storage
=======

Every Uberspace is provided with 10 GB of storage by default, you can :doc:`upgrade your storage <billing-general>` up to 100GB.
Over-usage of up to 10% is permitted for up to seven days. If you try to use even more than these 110% of your booked
storage or if you don't free up enough storage within seven days, we will block all write access for your account.
This means you won't be able to add any more data, including incoming e-mails or database storage.

You may check your current storage usage with the ``quota`` command:

.. code-block:: console

  [isabell@stardust ~]$ quota -gsl
  Disk quotas for group isabell (gid 1013):
       Filesystem   space   quota   limit   grace   files   quota   limit   grace
        /dev/sda2    713M  10240M  11264M              38       0       0


* ``space`` shows you how much storage you're currently using.
* ``quota`` shows the 10 GB *soft* limit.
* ``limit`` column shows the *hard* limit of 11 GB.
* ``grace`` column shows you how much time you have left to fix if you are over the soft limit.

.. note:: You will be notified once in 7 days by e-mail when your free space is less than ``1 GB`` and once again when your quota hits the over-usage grace period above ``100%``.

Find files which use a lot of storage
-------------------------------------

The beforementioned ``quota`` command calculates the needed storage for files that are owned by your user anywhere on the system not only within your home folder.
To find these files you should check the most common paths where files can be stored for your user:

.. code-block:: console

  [isabell@stardust ~]$ du -hs /home/$USER /var/www/virtual/$USER /tmp /var/tmp /var/lib/php-sessions/$USER 2> /dev/null
  6,9M	/home/isabell
  2,6M	/var/www/virtual/isabell
  36K	/tmp
  4,0K	/var/tmp
  0	/var/lib/php-sessions/isabell

The ``du`` command is good for an raw overview about your storage usage, but to have a deeper look which files use up a lot of space
we recommend the interactive tool ``ncdu``. You can use the command just within your working directory or with a path like
``ncdu /var/www/virtual/$USER`` and then browsing with your *keyboard arrows* and *enter*.

Deleted but open files
~~~~~~~~~~~~~~~~~~~~~~

There might also be already deleted files, that are still used by processes. You can check this with:

.. code-block:: console

  [isabell@stardust ~]$ lsof | grep deleted
  php-fpm   20326 isabell    4u      REG               0,75         666 1088691286 /run/user/1024/.ZendSem.s2qmkH (deleted)

The allocated bytes are shown in the 7th column, here ``666``.

.. _ram:

RAM
===

You can use up to 1536 MB (1.5 GB) of RAM. If you try to use more than this limit, your process will be killed. We reserve the right to ask nicely to reduce your usage if it is impacting other users or the overall performance of the host.

.. _cpu:

CPU
===

Every Uberspace gets a fair slice of CPU time. If the CPU is idle, you can use more than that. Processes that try to use too much CPU resources will be throttled.

