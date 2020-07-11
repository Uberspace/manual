.. _web-security-headers: 

####################
Web Security Headers
####################

A lot of modern web application security depends on HTTP headers. They enable
you to restrict which kinds of content from which sources will be executed on
your site. This can mitigate or even prevent a lot of popular client-side
attacks, like Cross-Site-Scripting or downgrades to plaintext HTTP.

Default headers
===============

To provide a basic level of security, we set the following HTTP headers on all
uberspaces for every domain:

``Referrer-Policy: strict-origin-when-cross-origin``
   Prevents the browser from leaking GET parameters to linked sites via HTTPS or leaking the domain over unencrypted HTTP altogether.

``Strict-Transport-Security: max-age=31536000``
   Enforce that the site may only be loaded via HTTPS for the next (non-leap) year.

``X-Content-Type-Options: nosniff``
   Prevent some browsers from interpreting JavaScript in non-js MIME types.

``X-Xss-Protection: 1; mode=block``
   Tell the browser to protect against cross-site scripting. 

``X-Frame-Options: SAMEORIGIN``
   Prevents the site from being used as a frame from another domain, i.e. to block other sites from calling actions on your site (i.e. deleting a profile). 


.. note::

    Changing the above values is possible using :ref:`web headers <headers>`.
