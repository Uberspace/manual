#######
Domains
#######

Setting Up Your Domain
======================

In order to use a domain for web with your Uberspace, you need to first set it up using our ``uberspace-add-domain`` tool. You can only add fully qualified domain names (FQDNs), wildcard domains are not available. All domains set up on a Uberspace account share the same `document root <web-documentroot>`_.

.. code-block:: shell

 [isabell@philae ~]$ uberspace-add-domain -d isabell.example -w
 The webserver's configuration has been adpated.
 Now you can use the following records for your dns:
     A -> 185.26.156.55
     AAAA -> 2a00:d0c0:200:0:b9:1a:9c:37

Once you've set up your domain using the uberspace-add-domain tool, the tool provides you with the ``A`` and ``AAAA`` records that need to be configured in your registrar's nameserver.

.. include:: includes/domain-dns.txt
.. include:: includes/domain-providers.txt
.. include:: includes/domain-register.txt

Removing a Domain
=================

To remove a domain, use the ``uberspace-del-domain`` tool:

.. code-block:: shell

 [isabell@philae ~]$ uberspace-del-domain -d isabell.example -w
 The server's configuration has been adapted.

Listing Your Domains
====================

If you want to find out which domains are currently set up for the web server on your Uberspace account, use the ``uberspace-list-domains`` command:

.. code-block:: shell

 [isabell@philae ~]$ uberspace-list-domains -w
 isabell.example
 isabell.uber.space

This will list all domains and sub-domains currently set up for this account, including the default ``$USER.uber.space``.

Where Do I Put My Files?
========================

All files that you want to publish under your domains belong in the `document root <web-documentroot>`_. Please refer to the `document root <web-documentroot>`_ article for further details.