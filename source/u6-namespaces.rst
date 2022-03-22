:orphan:

.. _u6-namespaces:

############################################################
Mail namespaces from automatically migrated accounts from U6
############################################################

On U6 you had the possibility to use domain namespaces for your mail accounts. Using this feature you could create mailboxes just for a specific domain on your Uberspace like this:

  - anna@example1.com
  - arthur@example2.com

Because this resulted in a heavy complicated setup on U6 and since we recommend to use only *one domain for one uberspace* anyway, this feature is no longer supported on U7.
After auto migration, your mailboxes will look like this if you used namespaces:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace mail domain list
  example1.com
  example2.com

  [isabell@stardust ~]$ uberspace mail user list
  namespace1-anna
  namespace2-arthur

  [isabell@stardust ~]$ ls ~/users
  namespace1-anna namespace2-arthur

The result would be these mail addresses:

  - namespace1-anna@example1.com
  - namespace1-anna@example2.com
  - namespace2-arthur@example1.com
  - namespace2-arthur@example2.com

And the original used addresses like on U6 would be rejected by our mailserver. To approach this issue in auto migration we do the following steps with namespaced mailboxes:

  - all your ``~/.qmail-*`` files are moved to ``~/old-dot-qmail``
  - the new ``~/.qmail-default`` will redirect *all new* incoming emails to ``~/namespace-collector``

This is a temporary setup to give you the chance and solve the namespaces in your own preferred way.

Example for solving the namespaces
----------------------------------

One possibility to migrate your namespace configuration to U7 is to stay on a single Uberspace and use all mailboxes for all domains, like this:

  - anna@example1.com
  - anna@example2.com
  - arthur@example1.com
  - arthur@example2.com

First you have to add the correct mailboxes:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace mail user add anna
  Enter a password for the mailbox:
  Please confirm your password:
  New mailbox created for user: 'anna', it will be live in a few minutes...

  [isabell@stardust ~]$ uberspace mail user add arthur
  Enter a password for the mailbox:
  Please confirm your password:
  New mailbox created for user: 'arthur', it will be live in a few minutes...

  [isabell@stardust ~]$ uberspace mail user list
  namespace1-anna
  namespace2-arthur
  anna
  arthur

Then you need to remove the temporary redirection to ``~/namespace-collector`` and run the spamfolder enable command to create a new ``.qmail-default`` file with our provided maildrop filter which is needed for the new delivery process.
:

.. code-block:: bash

  [isabell@stardust ~]$ rm ~/.qmail-default
  [isabell@stardust ~]$ uberspace mail spamfolder enable

If you want to have the old mails in the new mailboxes, you can just copy them:

.. code-block:: bash

  [isabell@stardust ~]$ rsync -rtu ~/users/namespace1-anna ~/users/anna
  [isabell@stardust ~]$ rsync -rtu ~/users/namespace2-arthur ~/users/arthur

Because there might be issues with incorrect index files, you should just remove them (they are automatically recreated):

.. code-block:: bash

  [isabell@stardust ~]$ find ~/users/ -name "dovecot*" -delete

To finish this you might want to remove the old namespaced mailboxes:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace mail user del namespace1-anna
  Mailbox for user 'namespace1-anna' deleted.
  [isabell@stardust ~]$ uberspace mail user del namespace2-arthur
  Mailbox for user 'namespace1-arthur' deleted.

Now you have a clean and U7 compatible mail setup.

.. note::

 Between migration and fixing the namespaces, some mails might have been redirected to ``~/namespace-collector``. You will have to decide by yourself how to deal with them, for example copying them to one of your mailboxes or creating a new mailbox ``namespace-collector`` and move them there to check with your email client.
