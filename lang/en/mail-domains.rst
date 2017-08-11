.. _mail-domains:

#######
Domains
#######

.. include:: includes/domain-register.txt

Setup
=====

In order to use your own domain for mail with your Uberspace, you need to first set it up using our ``uberspace-add-domain`` tool. You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_), wildcard domains are not available. 

.. code-block:: shell

 [isabell@philae ~]$ uberspace-add-domain -d isabell.example -m
 The mailserver's configuration has been adapted.
 Now you can use the following record for your dns:
   MX -> philae.uberspace.de

Once you’ve set up your domain using the uberspace-add-domain tool, the tool provides you with the ``MX`` record that needs to be configured in your registrar’s nameserver.

.. include:: includes/domain-dns.txt

Removal
=======

To remove a domain, use the ``uberspace-del-domain`` tool:

.. code-block:: shell

 [isabell@philae ~]$ uberspace-del-domain -d isabell.example -m
 The server's configuration has been adapted.

Listing
=======

If you want to find out which domains are currently set up for the mail server on your Uberspace account, use the ``uberspace-list-domains`` command:

.. code-block:: shell

 [isabell@philae ~]$ uberspace-list-domains -m
 isabell.example
 isabell.uber.space

This will list all domains and sub-domains currently set up for this account, including the default ``$USER.uber.space``.

.. include:: includes/domain-providers.txt

