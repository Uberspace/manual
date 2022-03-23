.. _cron:

####
Cron
####

Cron is a system-wide service to run tasks, so-called `cronjobs`, in user-specified intervals. For example, you might want to create a backup of your Uberspace every day. You could then create a cronjob that will copy all files on your account to another server.

Crontab
=======

Your cronjobs are stored in your ``crontab``. This is a table that contains all the information Cron needs to run your task. It looks like this:

.. code-block:: none

 * * * * *     /path/to/your/job
 ┬ ┬ ┬ ┬ ┬
 │ │ │ │ │
 │ │ │ │ └──── Day of the week (0-7) (Sunday can be 0 or 7)
 │ │ │ └────── Month (1-12)
 │ │ └──────── Day of the month (1-31)
 │ └────────── Hour (0-23)
 └──────────── Minute (0-59)

An asterisk (``*``) means that any value is valid, so if all columns contain an asterisk, the job will be started every minute, regardless of date, time, etc.

Please note that hours are always in 24-hour format, so 10 is 10 a.m., if you want 10 p.m., you need to enter 22 in the hour column.

To see your current crontab, run ``crontab -l``.

Examples
--------

.. code-block:: none

 15 * * * * /path/to/your/job/script.pl

The job /path/to/your/job/script.pl is started 15 minutes past every full hour.

.. code-block:: none

 30 10 * * * /path/to/your/job/script.pl

The job is started every day at 10:30 a.m.

.. code-block:: none

 * * * * * /path/to/your/job/script.pl

The job is started every minute.

Special characters: ``/``, ``,`` and ``-``:

| ``/`` is used to divide a time.
| ``,`` combines multiple times.
| ``-`` specifies a range (such as 1-5).
|

.. code-block:: none

 */5 * * * * /path/to/your/job/script.pl

The job is started every five minutes.

.. code-block:: none

 30 8-20 * * * /path/to/your/job/script.pl

The job is started at half past the hour between 8 a.m. and 8:30 p.m.

.. code-block:: none

 30 10 * * 1,2,3,4,5 /path/to/your/job/script.pl

The job is started on weekdays (Monday to Friday) at 10:30 a.m.

Aliases
-------

There are a couple of aliases that can be used instead of the numeric definitions:

| ``@hourly``: At every full hour (i.e.: ``0 * * * *``).
| ``@daily`` or ``@midnight``: Every day (i.e.: ``0 0 * * *``).
| ``@weekly``: Every week (i.e.: ``0 0 * * 0``).
| ``@monthly``: Once a month (i.e.: ``0 0 1 * *``).
| ``@yearly`` or ``@annually``: Once a year (i.e.: ``0 0 1 1 *``).
| ``@reboot``: After every reboot.
|

Adding, Modifying, and Deleting a Cronjob
-----------------------------------------

If you want to add or modify a new cronjob, you need to edit your ``crontab``. To do this, use the command ``crontab -e``. This will launch your standard editor and you can add a new job or modify an existing one.

To change your standard editor, set it in the ``VISUAL`` variable. So to use ``nano``, add this line to your :ref:`.bash_profile <home>`:

.. code-block:: none

 export VISUAL='nano'

Afterwards log out of your uberspace and log back in again.

To remove a cronjob, delete the line. If you want to only temporarily disable a cronjob, put a ``#`` at the beginning of the line. You can also use the ``#`` to add comments to the file.

After you've saved the temporary file and exited the editor, the changes will be applied.

PATH
----

``cron`` does not parse your :ref:`.bash_profile <home>` or :ref:`.bashrc <home>`, so ``$PATH`` is different from your shell. You can define ``$PATH`` in the ``crontab``. So if you want to include your ``~/bin`` directory in ``$PATH``, you need to insert this line before your cronjob:

.. code-block:: none

 PATH=/home/<USER>/bin:/usr/bin:/bin



Mails
-----

By default, ``cron`` will email the result of your cronjob to your :ref:`primary email address <mailboxes>`. To disable these emails, you can set an empty ``MAILTO`` variable before your actual cronjob. You will still receive emails if there is an error.

.. code-block:: none

 MAILTO=""
 15 * * * * /path/to/your/job/script.pl

Similarly, you can have the emails sent to a different email address:

.. code-block:: none

 MAILTO="my-other-address@provider.example"
 15 * * * * /path/to/your/job/script.pl

To completely disable any emails for a cronjob, you need to send both the standard output and standard error to ``/dev/null``:

.. code-block:: none

  15 * * * * /path/to/your/job/script.pl > /dev/null 2>&1

Logging
-------

If you want to save your cronjob's output to a log file, you can do so by using the ``>`` and ``>>`` operators. Please note that this also disables cron's emails.

To save only the most recent output, use ``>``:

.. code-block:: none

 15 * * * * /path/to/your/job/script.pl > /path/to/your/logfile 2>&1

To append the log file, use ``>>``:

.. code-block:: none

 15 * * * * /path/to/your/job/script.pl >> /path/to/your/logfile 2>&1
