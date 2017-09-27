.. _mail-domains:

#######
Domains
#######

.. include:: includes/domain-register.txt

Setup
=====

In order to use your own domain for mail with your Uberspace, you need to first set it up using our ``uberspace`` tool. You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_), wildcard domains are not available. 

.. code-block:: shell

 [isabell@philae ~]$ uberspace mail domain add -d isabell.example
 The mailserver's configuration has been adapted.
 Now you can use the following record for your dns:
   MX -> philae.uberspace.de

Once you’ve set up your domain using the uberspace mail domain add tool, the tool provides you with the ``MX`` record that needs to be configured in your registrar’s nameserver.

.. include:: includes/domain-dns.txt

Removal
=======

To remove a domain, use the ``uberspace`` tool:

.. code-block:: shell

 [isabell@philae ~]$ uberspace mail domain del -d isabell.example 
 The server's configuration has been adapted.

Listing
=======

If you want to find out which domains are currently set up for the mail server on your Uberspace account, use the ``uberspace`` command:

.. code-block:: shell

 [isabell@philae ~]$ uberspace mail domain list
 isabell.example
 isabell.uber.space

This will list all domains and sub-domains currently set up for this account, including the default ``$USER.uber.space``.

.. include:: includes/domain-providers.txt

