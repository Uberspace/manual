#######
Domains
#######

Setting Up Your Domain
======================

In order to use a domain for web with your Uberspace, you need to first set it up. A description of how to do this can be found in the `web`_ and `mail`_ articles, respectively.

The uberspace-add-domain Tool's Output
======================================

Once you've set up your domain using the uberspace-add-domain tool, the tool provides you with the records that need to be configured in your registrar's nameserver.

Sample Outputs
--------------
.. code-block:: shell

 [isabell@philae ~]$ uberspace-add-domain -d isabell.example -w
 The webserver's configuration has been adpated.
 Now you can use the following records for your dns:
     A -> 185.26.156.55
     AAAA -> 2a00:d0c0:200:0:b9:1a:9c:37

These outputs contain the values that you need to set-up the A/AAAA and MX records in your registrar's nameserver configuration.

.. include:: includes/domain-dns.txt
.. include:: includes/domain-providers.txt
.. include:: includes/domain-register.txt
