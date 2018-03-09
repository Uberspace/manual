.. _web-security: 

############
Web Security
############

HTTPS
=====

.. tip:: We enforce HTTPS and redirect HTTP to HTTPS. 
  We use HTTP status code 302 because we do not want to lock external domains into HTTPS forever; if we used 301, it would be much harder for our users to use the domain with another hosting provider with HTTP.

Every Uberspace has its own valid certificate. Every :ref:`external domain <web-domains>` gets a valid certificate from `Let's Encrypt <https://letsencrypt.org>`_ automatically.

Let's encrypt
-------------

We use `lua-resty-auto-ssl <https://github.com/GUI/lua-resty-auto-ssl>`_ to issue Let's Encrypt certificates for every external domain that is :ref:`connected to a Uberspace <web-domains>`. This happens automagically when a domain is requested by a client for the first time. For privacy reasons every domain gets its own certificate. We also handle the renewal, certificates will be renewed if they expire in less than 30 days.

Response header
===============

For security reasons we set some HTTP headers in our frontend:

``Referrer-Policy: strict-origin-when-cross-origin``: Prevents the browser from leaking GET parameters to linked sites via HTTPS or leaking the domain over unencrypted HTTP altogether.

``Strict-Transport-Security: max-age=172800``: Enforce that the site may only be loaded via HTTPS for the next two days.

``X-Content-Type-Options: nosniff``: Prevent insane browsers from interpreting JavaScript in non-js MIME types.

``X-Xss-Protection: 1; mode=block``: Tell the browser to protect against cross-site scripting. 

``X-Frame-Options: SAMEORIGIN``: Prevents the site from being used as a frame from another domain, i.e. to block other sites from calling actions on your site (i.e. deleting a profile). 
