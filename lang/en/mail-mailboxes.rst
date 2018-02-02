.. _mailboxes:

#########
Mailboxes
#########

Main mailbox
============

Every Uberspace account gets its own mailbox in the form of ``$USER@$SERVER.uberspace.de``. For convenience reasons you can use ``$USER@uber.space`` as well to receive mails.

.. tip::
  Since every Uberspace account is on a different server, we implement the ``@uber.space`` addresses with a proxy server that forwards mails to the corresponding mailbox on the server.

Additional mailboxes
====================

You can use additonal mailboxes in the form of ``$MAILBOX@$USER.uber.space``. If you have :ref:`set up additional domains <mail-domains>`, ``$MAILBOX@$DOMAIN`` will also work.

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
