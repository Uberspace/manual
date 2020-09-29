.. _mailfilters:

###############
Filtering mails
###############

We filter incoming mails with `Rspamd <https://rspamd.com>`_ which uses `multiple <https://rspamd.com/comparison.html>`_ filtering and statistical methods to generate a spam score, including (but not limited to) SPF, DMARC and DNS blacklists. Mails with a score greater than 10 get rejected. We are using Bayes filtering using the sqlite3 backend per server. To allow for some initial filtering we are retrieving example spam/ham databases provided by rspamd.com. We also autolearn ham and spam, what means that every mail with a negative score is auto-learned as ham, while every mail with a score higher than the rejection score is auto-learned as spam, given that the Bayes filter hasn't already identified it as ham or spam.

.. tip::
  We are working on a feature to let all users train the filter and to recategorize spam and ham by using appropriate folders.

Configure spam folder
=====================

Use ``uberspace mail spamfolder`` to configure the spam folder for all mailboxes in your account. Mails with a spam score greater than 5 will get sorted into the ``Spam`` folder in the according mailbox.

.. code-block:: console

  [eliza@dolittle ~]$ uberspace mail spamfolder status
  The spam folder is enabled.
  [eliza@dolittle ~]$ uberspace mail spamfolder disable
  The spam folder is now disabled.
  [eliza@dolittle ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

Background
----------

We implement the spam folder by manipulating your ``~/.qmail-default``. Enabling spam folders effectively means that a maildrop filter named ``~/.spamfolder`` is created which just includes the global template ``/opt/uberspace/etc/spamfolder.template``. That global template basically resembles what vdeliver does - retrieving the target Maildir and optional mail forward targets. Disabling spam folders effectively means resetting ``~/.qmail-default`` to call *vdeliver* instead of *maildrop*.

.. warning::
  Spam filtering and sorting does **not work** with the system mailbox. Create user mailboxes instead!
