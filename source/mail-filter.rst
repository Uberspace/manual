.. _mailfilters:

###############
Filtering mails
###############

We filter incoming mails with `Rspamd <hhttps://rspamd.com>`_ which uses `multiple <https://rspamd.com/comparison.html>`_ filtering and statistical methods to generate a spam score, including (but not limited to) SPF, DMARC and DNS blacklists. The score is then added to the mail header.

Configure spam filter
=====================

Use ``uberspace mail spamfilter`` to configure the filter for your account:

.. code-block:: console

  [eliza@dolittle ~]$ uberspace mail spamfilter status
  spam filtering enabled. 
  [eliza@dolittle ~]$ uberspace mail spamfilter disable
  spam filtering disabled.
  [eliza@dolittle ~]$ uberspace mail spamfilter enable
  spam filtering enabled. 

Header
======

Keep in mind that we only add the score to the mail header: ``X-Rspamd-Bar``, ``X-Rspamd-Report`` and ``X-Rspamd-Score``. You can use maildrop to sort the mails. 
