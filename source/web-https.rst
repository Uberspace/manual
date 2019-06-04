.. _web-https: 

#####
HTTPS
#####

Every Uberspace comes with enforced HTTPS its own certificate. Your
:ref:`external domains <web-domains>` as well as the ``.uber.space`` default
domains, are automatically provided with a free certificate from
`Let's Encrypt <https://letsencrypt.org>`_. In combination with our default
:ref:`security headers <web-security-headers>`, this ensures that you and your
users always use a secure connection to prevent eavesdropping and injection of
unwanted content.

.. tip:: We enforce HTTPS and always redirect HTTP to HTTPS. 
  
  During the redirect, we use HTTP status code 302 because we do not want to
  lock external domains into HTTPS forever; if we used 301, it would be much
  harder for our users to use the domain with another hosting provider with HTTP.
  Please note that may change in the future.


Let's encrypt
=============

We use `lua-resty-auto-ssl <https://github.com/GUI/lua-resty-auto-ssl>`_ to issue Let's Encrypt certificates for every external domain that is :ref:`connected to a Uberspace <web-domains>`. This happens automagically when a domain is requested by a client for the first time. For privacy reasons every domain gets its own certificate. We also handle the renewal, certificates will be renewed if they expire in less than 30 days.
