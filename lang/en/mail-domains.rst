.. _mail-domains:
#######
Domains
#######

Setting Up Your Domain
======================

In order to use your own domain for mail with your Uberspace, you need to first set it up using our ``uberspace-add-domain`` tool. You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_), wildcard domains are not available. 

.. code-block:: shell

 [isabell@philae ~]$ uberspace-add-domain -d isabell.example -m
 The mailserver's configuration has been adapted.
 Now you can use the following record for your dns:
   MX -> philae.uberspace.de

Once you’ve set up your domain using the uberspace-add-domain tool, the tool provides you with the ``MX`` record that needs to be configured in your registrar’s nameserver.

.. include:: includes/domain-dns.txt
.. include:: includes/domain-providers.txt
.. include:: includes/domain-register.txt
