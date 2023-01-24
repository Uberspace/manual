#######
Domains
#######

.. include:: includes/domain-register.txt

Setup
=====

In order to use your own domain for mail with your Uberspace, you need to first set it up using our ``uberspace`` tool. You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_), wildcard domains are not available.

.. code-block:: console

  [isabell@stardust ~]$ uberspace mail domain add isabell.example
  The mailserver's configuration has been adapted.
  Now you can use the following records for your DNS:

  isabell.example.                      IN   MX 0 stardust.uberspace.de.
  isabell.example.                      IN  TXT "v=spf1 include:spf.uberspace.de ~all"
  uberspace._domainkey.isabell.example. IN  TXT "v=DKIM1;t=s;n=core;p=MIICIj...=="

  The trailing dot may be skipped, if the interface does not accept it.

  [isabell@stardust ~]$

Once you’ve set up your domain using the uberspace mail domain add tool, the tool provides you with the ``MX`` and other records that need to be configured in your registrar’s nameserver. Please be aware that the trailing dot in ``stardust.uberspace.de.`` is the correct notation of a DNS record to indicate the domains root like here, but you can skip it if the domain hoster UI does not accept it.

You can get the correct DNS records anytime after setup with ``uberspace records show isabell.example``:

.. code-block:: console

  [isabell@stardust ~]$ uberspace records show isabell.example
  $ORIGIN isabell.example
  @                    IN   MX 0 stardust.uberspace.de.
  @                    IN  TXT "v=spf1 include:spf.uberspace.de ~all"
  uberspace._domainkey IN  TXT "v=DKIM1;t=s;n=core;p=MIICIj...=="

  [isabell@stardust ~]$

Domain validation
-----------------

We will need to validate that the ``MX DNS`` record of your domain is really set up to the corresponding host with ``HOSTNAME.uberspace.de.``. The automated check will run normally *every 30 seconds* to lookup the DNS records of the domains you added to your account. If the correct value is missing this will be shown as an error next to the specific domain listing:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail domain list
 example.com DNS INVALID (checked 2021-08-20 12:00)
 isabell.uber.space

Until this check has passed successfully, you will not be able to use this domain for receiving mails or to login to your mailbox. After a *failed* check, this domain will be checked again only after *3 minutes*.

.. warning::
  To get the most accurate record value, we check the responsible domain nameserver directly. But nevertheless it can take some minutes for the correct data to show up after you set up the records at your domain hoster. You can check yourself with ``dig example.com MX +short`` if the host already gets the correct values.

.. include:: includes/domain-dns.txt

.. include:: includes/domain-idn.txt

Removal
=======

To remove a domain, use the ``uberspace`` tool:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail domain del isabell.example
 The server's configuration has been adapted.

Listing
=======

If you want to find out which domains are currently set up for the mail server on your Uberspace account, use the ``uberspace`` command:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail domain list
 isabell.example
 isabell.uber.space

This will list all domains and sub-domains currently set up for this account, including the default ``$USER.uber.space``.

.. include:: includes/domain-providers.txt
