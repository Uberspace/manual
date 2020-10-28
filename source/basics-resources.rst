.. _resources:

################
System Resources
################

.. _quota:

Storage
=======

Every Uberspace is provided with 10 GB of storage. While this may sound like a lot for some people, for others, it's not enough. Over-usage of up to 10% (=1 GB) is permitted for up to seven days. If you try to use even more than these combined 11 GB or if you don't free up enough storage within seven days, we will block all write access for your account. This means you won't be able to add any more data, including incoming e-mails or database storage.

In order to avoid hitting this limit, you can check your current storage usage using the ``quota`` command:

.. code-block:: console

  [isabell@stardust ~]$ quota -gsl
  Disk quotas for group isabell (gid 1013): 
       Filesystem   space   quota   limit   grace   files   quota   limit   grace
        /dev/sda2    713M  10240M  11264M              38       0       0        


* ``space`` shows you how much storage you're currently using.
* ``quota`` shows the 10 GB *soft* limit.
* ``limit`` column shows the *hard* limit of 11 GB.
* ``grace`` column shows you how much time you have left to fix if you are over the soft limit.

.. _ram:

RAM
===

You can use up to 1536 MB (1.5 GB) of RAM. If you try to use more than this limit, your process will be killed. We reserve the right to ask nicely to reduce your usage if it is impacting other users or the overall performance of the host.

.. _cpu:

CPU
===

Every Uberspace gets a fair slice of CPU time. If the CPU is idle, you can use more than that. Processes that try to use too much CPU resources will be throttled.

