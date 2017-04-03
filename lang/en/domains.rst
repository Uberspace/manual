#######
Domains
#######

Registering Domains
===================

Uberspace is strictly a hosting provider, which is why we don't offer domain registrations. You can, of course, use any domain that you registered with an external domain provider with your Uberspace account. At the end of this article is a list of some popular domain providers.

Setting Up Your Domain
======================

In order to use a domain for web or e-mail with your Uberspace, you need to first set it up. A description of how to do this can be found in the `web`_ and `mail`_ articles, respectively.

The uberspace-add-domain Tool's Output
======================================

Once you've set up your domain using the uberspace-add-domain tool, the tool provides you with the records that need to be configured in your registrar's nameserver.

Sample Outputs
--------------
Web::
 [isabell@philae ~]$ uberspace-add-domain -d isabell.example -w
 The webserver's configuration has been adpated.
 Now you can use the following records for your dns:
     A -> 185.26.156.55
     AAAA -> 2a00:d0c0:200:0:b9:1a:9c:37

Mail::
 [isabell@philae ~]$ uberspace-add-domain -d isabell.example -m
 The mailserver's configuration has been adapted.
 Now you can use the following record for your dns:
   MX -> philae.uberspace.de

These outputs contain the values that you need to set-up the A/AAAA and MX records in your registrar's nameserver configuration.


What Is DNS?
============

The Domain Name System (DNS) is a directory used to look up information about a host name. It usually includes at least a so-called A record, which contains the IPv4 address assigned to this host. The AAAA record does the same for IPv6 addresses. If the domain should be able to receive e-mails, a mail exchange server is specified in the MX record. 

There are other types of DNS records used to specify various services for this domain. Wikipedia provides a `list <https://en.wikipedia.org/wiki/List_of_DNS_record_types>`_ if you're curious.

Domain Providers
================

* `INWX <https://inwx.de>`_
	* `How do I set-up a MX record? <https://kb.inwx.com/index.php?action=artikel&cat=22&id=212&artlang=en&highlight=mx>`_	
	* `How can I forward a domain to an IP address (A/AAAA record)? <https://kb.inwx.com/?action=artikel&cat=22&id=214&artlang=en&highlight=a%5C-record>`_
* `Namecheap <https://www.namecheap.com/>`_
	* `How can I set up MX records required for mail service? <https://www.namecheap.com/support/knowledgebase/article.aspx/322/2237/how-can-i-set-up-mx-records-required-for-mail-service>`_
	* `How do I set up host records for a domain? <https://www.namecheap.com/support/knowledgebase/article.aspx/434/2237/how-do-i-set-up-host-records-for-a-domain>`_ 