#########
Mailboxes
#########

System mailbox
==============

Every Uberspace account gets its own mailbox in the form of ``$USER@$SERVER.uberspace.de``. For convenience reasons you can use ``$USER@uber.space`` as well to receive mails.

.. tip::
  If you'd like to receive mails from other people or providers use ``$USER@uber.space``, not ``$USER@$SERVER.uberspace.de``. The latter may not be
  available in future product versions.

Mailboxes
=========

The e-mail address of your mailboxes is in the form of ``$MAILBOX@$USER.uber.space``. If you have :doc:`set up additional domains <mail-domains>`, ``$MAILBOX@$DOMAIN`` will also work.

Plus adressing
--------------

Plus addressing allows you to give out alternative addresses like ``mailbox+ebay@example.com`` that still arrive at your
mailbox. You can create a `filter rule <mail-filters>`_ to automatically filter messages sent to plussed addresses,
which can be helpful for managing mailing lists and site registrations.

.. warning:: The :doc:`spamfolder <mail-spam>` needs to be enabled to use plussed mailaddresses.

Setup a new mailbox
-------------------

To add a new mailbox to your Uberspace, run the ``uberspace mail user add <mailbox>`` command and enter your password when prompted. So to add the mailbox ``post``, run this command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user add post
 Enter a password for the mailbox:
 Please confirm your password:
 New mailbox created for user: 'post', it will be live in a few minutes...

.. tip::
  Nothing is shown while entering your password; that’s absolutely correct and works as intended – just enter it blindly and press Enter!

.. warning::
  While some special characters such as ``.``, ``+``, ``-``, ``_`` are allowed in mailbox names, there are `rules <https://en.wikipedia.org/wiki/Email_address#Local-part>`_ limiting their usage. Please make sure your mailbox name adheres to these rules.

Password Requirements
~~~~~~~~~~~~~~~~~~~~~

Your mailbox password has to comply with a set of rules:

- A minimum length of 8 characters.
- Not only letters.
- Not only numbers.
- Not prohibited by us.
- A password score of ``>=4``.

We **prohibit the use of some passwords** we deem too common (like ``test1234``) or too easy to guess, e.g. if your mailbox name should be ``fn0rd``, we will reject ``testfn0rd`` as a password.

In addition to the above, we also check your password using `zxcvbn <https://github.com/dwolfhub/zxcvbn-python>`_. This results in a score for your password, based on how easy it might be guessed and / or cracked (higher results mean a better estimated password strenght). We require a **password score** of at least ``4``.

If we reject your password, we try to give you an error messages that explains why. Hopefully it will help you to choose a fitting alternative.

.. tip:: We strongly recommend to use only `ASCII characters <https://en.wikipedia.org/wiki/ASCII#Printable_characters>`_ in your password. Non-ASCII characters may work in some circumstances, but this depends on the encoding used by your client being compatible with the one used by the mail server.

List existing mailboxes
-----------------------

You can list your existing mailboxes using the ``uberspace mail user list`` command, e.g. if you have setup mailboxes for `post` and `info`:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user list
 info
 post


Changing passwords
------------------

To change a mailbox's password, run the ``uberspace mail user password <mailbox>`` command, so in order to change the password for the mailbox ``post``, run this command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user password post
 Enter a password for the mailbox:
 Please confirm your password:
 New mailbox password set for user 'post'.

Delete a mailbox
----------------

You can delete a mailbox using the ``uberspace mail user del <mailbox>`` command. To delete the mailbox ``post``, run the following command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user del post
 Mailbox for user 'post' deleted.

.. _catchall:

Catch-all mailbox
=================

You can configure any existing mailbox to be the catch-all mailbox.

.. tip::
  A catch-all mailbox will "catch all" of the emails addressed to the domains on your account that do not exist in the mail server - this can help avoid losing emails due to misspelling. Without a catch-all mailbox these mails will get rejected by the server.

.. code-block:: bash

  [isabell@stardust ~]$ uberspace mail catchall status
  No catchall configured.
  [isabell@stardust ~]$

To set the catch-all mailbox run ``uberspace mail catchall set <mailbox>``. In this example we make the mailbox ``post`` the catch-all mailbox:

.. code-block:: bash

  [isabell@stardust ~]$ uberspace mail catchall set post
  Mails, which cannot be matched to a mailbox, will be sent to post.
  [isabell@stardust ~]$

To remove the catch-all run ``uberspace mail catchall del``:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail catchall del
 No catchall configured.
 [isabell@stardust ~]$
