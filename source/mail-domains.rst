.. _mail-domains:

#######
Domains
#######

.. include:: includes/domain-register.txt

Setup
=====

In order to use your own domain for mail with your Uberspace, you need to first set it up using our ``uberspace`` tool. You can only add fully qualified domain names (`FQDNs <https://en.wikipedia.org/wiki/Fully_qualified_domain_name>`_), wildcard domains are not available. 

.. code-block:: shell

 [isabell@philae ~]$ uberspace mail domain add isabell.example
 The mailserver's configuration has been adapted.
 Now you can use the following record for your dns:
   MX  -> philae.uberspace.de
   TXT -> v=spf1 mx ~all

Once you’ve set up your domain using the uberspace mail domain add tool, the tool provides you with the ``MX`` record that needs to be configured in your registrar’s nameserver.

.. warning:: Please use only the provided host name for your ``MX`` record. If you use any other host name for your ``MX``, the mailserver will not accept your domain.

SPF record
----------

The `Sender Policy Framwork <https://tools.ietf.org/html/rfc4408>`_ (SPF) is a system that allows mailservers to check if another mail server is allowed to send mails for a specific domain. To specify which servers are allowed to send mails for your domain, a ``TXT`` DNS record is set. Adding  Uberspace host to the list of allowed servers for your domain might increase your chances of passing spam filters. Assuming you have set your Uberspace host as your domain's ``MX``, you can set a ``TXT``-type record for your domain using this snippet:

.. code-block:: none

 v=spf1 mx ~all

This instructs other mail servers to accept mails from your domain if they originate from your domain's MX and to deliver any mails that claim to be from your domain but originate from a different server to the spam folder.

.. include:: includes/domain-dns.txt

.. include:: includes/domain-idn.txt


Removal
=======

To remove a domain, use the ``uberspace`` tool:

.. code-block:: shell

 [isabell@philae ~]$ uberspace mail domain del isabell.example 
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

