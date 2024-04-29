.. _config-is-catchall:

The file is a subaddressing catchall with a "-" delimiter
=========================================================

``id:config-is-catchall``

This error indicates that this file is setup as a catchall for all mailaddresses like **mailbox-*@example.com**. This
kind of delimiter is no longer available in the standard mailsystem as we use the more common and more explicit
``+``-subadressing.

If you have used this kind of subaddressing catchall heavily its probably very hard to change all the mailaddresses
in the original used places. You can create a workaround to keep using those mailaddresses, even with separate handling
and mailboxes etc. But it depends very much on how you use these catchall and other mailaddresses.

.. include:: ../includes/levels/fatal.rst

Workaround to keep "-" delimiter catchall
-----------------------------------------

Assuming that you have a ``.qmail-shops-default`` that you want to migrate.

First you will need to setup a general catchall, therefore you create for example a mailbox named ``catchall-mailbox``:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail user add catchall-mailbox
 Enter a password for the mailbox:
 Please confirm your password:
 New mailbox created for user: 'catchall', it will be live in a few minutes...

Then you configure the catchall to forward mails to this mailbox:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail catchall set catchall-mailbox
 Mails, which cannot be matched to a mailbox, will be sent to catchall-mailbox.

Then on the mailbox ``catchall-mailbox`` you need to configure with Sieve filters, that all mails **except** mails to
``shops-*@`` will be rejected:

.. code-block::

  require ["fileinto", "reject"];
  if address :matches "to" "hallo-*@*" {
    keep;
  } else {
    reject;
  }

This example script will keep the mails in the new mailbox, but you can also use ``fileinto`` to store them in specific
folders or forward them to another mailaddress with ``redirect``.