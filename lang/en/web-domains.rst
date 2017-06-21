#######
Domains
#######

Setting Up Your Domain
======================

In order to use a domain for web with your Uberspace, you need to first set it up using our ``uberspace-add-domain`` tool.

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

