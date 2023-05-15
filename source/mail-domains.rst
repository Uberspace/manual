############
Mail Domains
############

Every Uberspace account gets its own mail domain in the form of ``$USER.uber.space``. You can setup as many additional domains as you like.

.. include:: includes/domain-register.txt


Setup
=====

In order to use your own domain for mail with your Uberspace, you need to first set it up using our ``uberspace`` tool:

.. code-block:: console

  [isabell@stardust ~]$ uberspace mail domain add example.com
  The mailserver's configuration has been adapted.
  Now you can use the following records for your DNS:

  example.com.                      IN   MX 0 stardust.uberspace.de.
  example.com.                      IN  TXT "v=spf1 include:spf.uberspace.de ~all"
  uberspace._domainkey.example.com. IN  TXT "v=DKIM1;t=s;n=core;p=MIICIj...=="

  The trailing dot may be skipped, if the interface does not accept it.

Once you’ve set up your domain using the ``uberspace`` tool you will be provided with several records that need to be
configured in your domain registrar’s nameserver.

.. hint::
  You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_),
  wildcard domains are not available.

.. hint::
  Please be aware that the trailing dot in ``stardust.uberspace.de.`` is the correct notation of a DNS record to indicate
  the domains root like here, but you can skip it if the domain hoster UI does not accept it.

Domain records
==============

You can get the correct DNS records anytime after setup with ``uberspace records show example.com``:

.. code-block:: console

  [isabell@stardust ~]$ uberspace records show example.com
  $ORIGIN example.com
  @                    IN   MX 0 stardust.uberspace.de.
  @                    IN  TXT "v=spf1 include:spf.uberspace.de ~all"
  uberspace._domainkey IN  TXT "v=DKIM1;t=s;n=core;p=MIICIj...=="

The output of this command uses the `zone file format <https://en.wikipedia.org/wiki/Zone_file>`_ to show the proposed
records for your domain. In the following we provide some short explanations of those records:

MX record
---------

The ``MX`` record is the primary record for your mail domain setup. It should point directly to your hostname like
``stardust.uberspace.de.``. It tells other mailservers, to contact this host for transmitting mails to your domain.

SPF record
----------

You should set a `SPF record <https://en.wikipedia.org/wiki/Sender_Policy_Framework>`_ to make sure that only specific
mailservers are allowed to send mails for your domain.

.. warning::
  Some mailproviders like GMail are even blocking mails when there is no SPF record provided for the sending domain.

We provide a list of our allowed mailservers and you will need to add a ``TXT`` record with the content
``v=spf1 include:spf.uberspace.de ~all`` to your domain to include it. You can of course adjust those settings if you
know what you do.

DKIM record
-----------

DKIM is an additional security method that signs the ``FROM`` part of your mail with a specific private key. Each Uberspace
has its own private/public key pair, you will need to add the public key to your domain records to make use of this.

You will need to add a ``TXT`` record to the subdomain ``uberspace._domainkey.example.com`` with the content of your public
DKIM key in the format ``v=DKIM1;t=s;n=core;p=MIICIj(quite-long-multiple-chars)...==``.

.. hint::
  At the record subdomain ``_domainkey.example.com`` is the part that other mailservers will look up for dkim key selectors
  and ``uberspace`` is the selector we use when sending out mails via smtp.



Domain validation
=================

We will frequently validate that the ``MX`` record of your domain is really set up to the corresponding host with
``HOSTNAME.uberspace.de.``. The automated check will run normally *every 30 seconds* to lookup the DNS records of the
domains you added to your account. If the correct value is missing this will be shown as an error next to the specific
domain listing:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail domain list
 example.com DNS INVALID (checked 2021-08-20 12:00)
 isabell.uber.space

Until this check has passed successfully, you will not be able to use this domain for receiving mails or to login to your
mailbox. After a *failed* check, this domain will be checked again only after *3 minutes*.

.. warning::
  To get the most accurate record value, we check the responsible domain nameserver directly. But nevertheless it can take
  some minutes for the correct data to show up after you set up the records at your domain hoster. You can check yourself
  with ``dig example.com MX +short`` if the host already gets the correct values.


Listing
=======

If you want to find out which domains are currently set up for the mail server on your Uberspace account, use the
``uberspace`` command:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail domain list
 isabell.example
 isabell.uber.space

This will list all domains and sub-domains currently set up for this account, including the default ``$USER.uber.space``.


Removal
=======

To remove a domain, use the ``uberspace`` tool:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail domain del isabell.example
 The server's configuration has been adapted.


Internationalized domains
=========================

.. include:: includes/domain-idn.txt


.. include:: includes/domain-providers.txt
