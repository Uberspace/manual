#####
HTTPS
#####

Every Uberspace comes with its own enforced HTTPS certificate. Your
:doc:`external domains <web-domains>` as well as the ``.uber.space`` default
domains, are automatically provided with a free certificate from
`Let's Encrypt <https://letsencrypt.org>`_. In combination with our default
:doc:`security headers <web-security-headers>`, this ensures that you and your
users always use a secure connection to prevent eavesdropping and injection of
unwanted content.


Let's encrypt
=============

We use `lua-resty-auto-ssl <https://github.com/GUI/lua-resty-auto-ssl>`_ to issue Let's Encrypt certificates for every external domain that is :doc:`connected to a Uberspace <web-domains>`. This happens automagically when a domain (``Host`` header) is first seen by our webserver. For privacy reasons every domain gets its own certificate. We also handle the renewal, certificates will be renewed if they expire in less than 30 days.

Certificate Access
------------------

Once a certificate has been generated, you can find all relevant files in ``~/etc/certificates``.
This includes your certificate chain - ``<domain>.crt`` - as well as the private
key - ``<domain>.key``. If you do not make use of our webserver, you can copy
or directly use these files in your application. If you use PHP, static files or
:doc:`web backends <web-backends>`, we handle HTTPS for you and there is no need
to do anything.

.. warning::

    Certificates issued by let's encrypt have a short life of 90 days. We renew
    certificates when they are 60 days old. In practice, the provided files will
    change every 1-2 months.

    Make sure to either restart your service once a month, or watch the files for
    changes and restart accordingly. Otherwise your service will use an
    outdated, invalid certificate.
