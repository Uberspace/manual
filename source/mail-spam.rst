.. _mailfilters:

###############
Filtering mails
###############

We filter incoming mails with `Rspamd <https://rspamd.com>`_ which uses `multiple <https://rspamd.com/comparison.html>`_ filtering and statistical methods to generate a spam score, including (but not limited to) SPF, DMARC and DNS blacklists. You can train the filter by moving mails into the ``Spam`` folder in your mailbox, mails moved out of the ``Spam`` folder will be learned as ham. We also autolearn ham and spam, which means that every mail with a negative score is auto-learned as ham, while every mail with a score higher than the rejection score is auto-learned as spam, given that the Bayes filter hasn't already identified it as ham or spam.

Configure spam folder
=====================

Use ``uberspace mail spamfolder`` to configure the spam folder for all mailboxes in your account. Mails with a spam score greater than 5 will get sorted into the ``Spam`` folder in the according mailbox. If you want to change the rejection score, please have a look at the examples in our description for :ref:`Sieve <mail-filters>`.

.. code-block:: console

  [isabell@stardust ~]$ uberspace mail spamfolder status
  The spam folder is enabled.
  [isabell@stardust ~]$ uberspace mail spamfolder disable
  The spam folder is now disabled.
  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

.. note::
  Mails within the spam folder are auto-expunged after 30 days.

Background
----------

We implement the spam folder by manipulating your ``~/.qmail-default``. Enabling spam folders effectively means that a maildrop filter named ``~/.spamfolder`` is created which just includes the global template ``/opt/uberspace/etc/spamfolder.template``. That global template basically resembles what vdeliver does - retrieving the target Maildir and optional mail forward targets. Disabling spam folders effectively means resetting ``~/.qmail-default`` to call *vdeliver* instead of *maildrop*.

.. warning::
  Spam filtering and sorting does **not work** with the system mailbox. Create user mailboxes instead!
