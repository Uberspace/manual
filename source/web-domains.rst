.. _web-domains:

#######
Domains
#######

Every Uberspace account gets its own domain in the form of ``$USER.uber.space``. You can setup as many additional domains as you like.

.. include:: includes/domain-register.txt

Setup
=====

In order to use your own domain for web with your Uberspace, you need to first set it up using our ``uberspace`` tool. You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_), wildcard domains are not available. By default, all domains set up on a Uberspace account share the same :ref:`docroot`. Please refer to :ref:`docroot` for instructions on how to use seperate Document Roots for your domains.

.. code-block:: console

 [isabell@philae ~]$ uberspace web domain add isabell.example
 The webserver's configuration has been adpated.
 Now you can use the following records for your dns:
     A -> 185.26.156.55
     AAAA -> 2a00:d0c0:200:0:b9:1a:9c:37

Once you've set up your domain using the ``uberspace`` tool, the tool provides you with the ``A`` and ``AAAA`` records that need to be configured in your registrar's nameserver.

.. include:: includes/domain-dns.txt

.. include:: includes/domain-idn.txt

Subdomains
==========

Any subdomain that you wish to use needs to be added individually. So in order to also use ``www.isabell.example``, you need to run ``uberspace web domain add www.isabell.example`` as well. You can also add subdomains for your ``isabell.uber.space`` domain.

Because we check on each host if a domain is already under control of another user of that host, you might encounter an error if you try to add a subdomain with another user than the one you used to configure the same main domain:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web domain add example.com
  [..]
  [isabell2@stardust ~]$ uberspace web domain add sub.example.com
  Can't add domain to the configuration. It is a subdomain of a domain already configured for another Uberspace account.

Then you can just add the subdomain *first* on the one user and *then* the main domain on the other user.

.. note:: We very much encourage to use separate uberspace accounts for separate projects or apps and so far subdomains. And you shouldn't usually run in this problem because in most cases you won't end up with different users on the same host.

Removal
=======

To remove a domain, use the ``uberspace`` tool:

.. code-block:: console

 [isabell@philae ~]$ uberspace web domain del isabell.example
 The server's configuration has been adapted.

Listing
=======

If you want to find out which domains are currently set up for the web server on your Uberspace account, use the ``uberspace`` command:

.. code-block:: console

 [isabell@philae ~]$ uberspace web domain list
 isabell.example
 isabell.uber.space

This will list all domains and sub-domains currently set up for this account, including the default ``$USER.uber.space``.

.. include:: includes/domain-providers.txt

