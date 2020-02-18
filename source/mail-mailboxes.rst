.. _mailboxes:

#########
Mailboxes
#########

System mailbox
==============

Every Uberspace account gets its own mailbox in the form of ``$USER@$SERVER.uberspace.de``. For convenience reasons you can use ``$USER@uber.space`` as well to receive mails.

.. tip::
  You should only use the system mailbox for computer generated mails like status updates and such since you can't use it with your own domains and no filtering is done.

Mailboxes
=========

You can use mailboxes in the form of ``$MAILBOX@$USER.uber.space``. If you have :ref:`set up additional domains <mail-domains>`, ``$MAILBOX@$DOMAIN`` will also work.

Setup a new mailbox
-------------------

To add a new mailbox to your Uberspace, run the ``uberspace mail user add`` command and enter your password when prompted. So to add the mailbox ``post``, run this command:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user add post
 Enter a password for the mailbox:
 Please confirm your password:
 New mailbox created for user: 'post', it will be live in a few minutes...

.. tip::
  Nothing is shown while entering your password; that’s absolutely correct and works as intended – just enter it blindly and press Enter!

.. warning::
  While some special characters such as ``.``, ``+``, ``-``, ``_`` are allowed in mailbox names, there are `rules <https://en.wikipedia.org/wiki/Email_address#Local-part>`_ limiting their usage. Please make sure your mailbox name adheres to these rules.

.. tip:: We strongly recommend to use only `ASCII characters <https://en.wikipedia.org/wiki/ASCII#Printable_characters>`_ in your password. Non-ASCII characters may work in some circumstances, but this depends on the encoding used by your client being compatible with the one used by the mail server.

List existing mailboxes
-----------------------

You can list your existing mailboxes using the ``uberspace mail user list`` command, e.g. if you have setup mailboxes for `post` and `info`:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user list
 info
 post


Changing passwords
------------------

To change a mailbox's password, run the ``uberspace mail user password`` command, so in order to change the password for the mailbox ``post``, run this command:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user password post
 Enter a password for the mailbox:
 Please confirm your password:
 New mailbox password set for user 'post'.

Delete a mailbox
----------------

You can delete a mailbox using the ``uberspace mail user del`` command. To delete the mailbox ``post``, run the following command:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user del post
 Mailbox for user 'post' deleted.

.. _catchall:

Catch-all mailbox
=================

A catch-all mailbox will "catch all" of the emails addressed to the domains on your account that do not exist in the mail server - this can help avoid losing emails due to misspelling. Without a catch-all mailbox these mails will get rejected by the server.

.. code-block:: bash

  [isabell@philae ~]$ uberspace mail catchall status
  No catchall configured.
  [isabell@philae ~]$

To configure a catch-all mailbox, run the ``uberspace mail catchall set`` command. To make the mailbox ``post`` the catch-all mailbox, run this command:

.. code-block:: bash

  [isabell@philae ~]$ uberspace mail catchall set post
  Mails, which cannot be matched to a mailbox, will be sent to post.
  [isabell@philae ~]$

To remove the catch-all run ``uberspace mail catchall del``:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail catchall del
 No catchall configured.
 [isabell@philae ~]$
