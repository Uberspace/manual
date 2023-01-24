#############
Spam handling
##############

Incoming mails
==============

We filter incoming mails with `Rspamd <https://rspamd.com>`_ which uses `multiple <https://rspamd.com/comparison.html>`_ filtering and statistical methods to generate a spam score including (but not limited to) SPF, DMARC and DNS blocklists.

You can train the filter by moving mails into the ``Spam`` folder in your mailbox, mails moved out of the ``Spam`` folder will be learned as ``ham`` (= good mails).

We also autolearn ``ham`` and ``spam``, which means that every mail with a negative score is auto-learned as *ham*, while every mail with a score higher than the rejection score is auto-learned as *spam* (given that the Bayes filter hasn't already identified them).

Configure spamfolder
--------------------

Use ``uberspace mail spamfolder`` to configure the spam folder for all mailboxes and forwards in your account. Mails with a spam score greater than ``5`` will get sorted into the ``Spam`` folder in the according mailbox.

.. code-block:: console

  [isabell@stardust ~]$ uberspace mail spamfolder status
  The spam folder is enabled.
  [isabell@stardust ~]$ uberspace mail spamfolder disable
  The spam folder is now disabled.
  [isabell@stardust ~]$ uberspace mail spamfolder enable
  The spam folder is now enabled.

.. note::
  Mails within the spam folder are auto-expunged after 30 days.

.. tip::
  If you want to change the rejection score, please have a look at the examples in our description for :doc:`Sieve <mail-filters>`.


Background
----------

We implement the spam folder by manipulating your ``~/.qmail-default``. Enabling spam folders effectively means that a maildrop filter named ``~/.spamfolder`` is created which just includes the global template ``/opt/uberspace/etc/spamfolder.template``.

That global template basically resembles what ``vdeliver`` does - retrieving the target Maildir and optional mail forward targets. Disabling spam folders effectively means resetting ``~/.qmail-default`` to call *vdeliver* instead of *maildrop*.

.. warning::
  Spam filtering and sorting does **not work** with the system mailbox ``username@uber.space``. Create user mailboxes instead!

Outgoing Mails
==============

SPF
---

The `Sender Policy Framework <https://tools.ietf.org/html/rfc4408>`_ (SPF) is a system that allows mailservers to check if another mail server is allowed to send mails for a specific domain. To specify which servers are allowed to send mails for your domain, you can set a ``TXT`` :doc:`DNS record<mail-domains>`. Adding  Uberspace hosts to the list of allowed servers for your domain will increase your chances of passing spam filters. This instructs other mail servers to accept mails from your domain if they originate from our hosts and to deliver any mails that claim to be from your domain but originate from a different server to the spam folder.

DKIM
----

`DomainKeys Identified Mail <https://tools.ietf.org/html/rfc6376>`_ (DKIM) allows the receiver to check that an email claimed to have come from a specific domain was indeed authorized by the owner of that domain. It achieves this by affixing a digital signature, linked to a domain name, to each outgoing email message.

We generate a DKIM key for every user, you can get yours with ``uberspace records list``:

  [isabell@stardust ~]$ uberspace records list
  $ORIGIN isabell.example
  @                    IN   MX 0 stardust.uberspace.de.
  @                    IN  TXT "v=spf1 include:spf.uberspace.de ~all"
  uberspace._domainkey IN  TXT "v=DKIM1;t=s;n=core;p=MIICIj...=="

  [isabell@stardust ~]$
