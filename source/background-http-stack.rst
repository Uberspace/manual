.. _httpstack:

##########
HTTP Stack 
##########

A couple hundred users per host, a few domains each, security headers, HTTPS
with let's encrypt, websocket, pass-through, :ref:`web backends <backends>`,
htaccess.. at some point a web setup reaches a point, when there are too many
feature to handle them all with just one web server software. That's why we're
employing two of them back-to-back: nginx_ and `Apache httpd`_.

::

                 _
               (`  ).
              (     ).                 .-------.        .-------.
             _(       '`.  ----------> | nginx | -----> | httpd |
         .=(`( Internet )              '-------'        '-------'
         ((    (..__.:'-'                  |                => php via php-fpm
         `(       ) )                      |                => static files
           ` __.:'   )                     |                => htaccess
                  --'                      |
                                           |            .--------------.
                                           '----------> | Web Backends |
                                                        '--------------'
                                                            => per-user nginx
                                                            => nodejs, python, ruby, ...
                                                            => gogs, mattermost, matrix, ...
  .   

nginx
=====

nginx handles all the nitty gritty of accepting requests from browsers, making
sure HTTPS works properly and passing requests through to configured :ref:`web
backends <backends>`. It also connects to apache for more traditional web
development needs.

Within nginx each user domain gets their own ``server`` block. On a fresh
uberspace, it might look like this:

.. code-block:: console
  :emphasize-lines: 13

  [root@stardust ~]# cat /etc/nginx/user.d/marie.conf
  # manged by uberspace-generate-nginx-config

  server {
      listen [::]:443;

      server_name marie.uber.space;

      ssl_certificate_by_lua_block {
          auto_ssl:ssl_certificate()
      }

      location / { proxy_pass http://apache; }

      # domain specific backends
      # global backends, minus the ones specified as domain-ones
  }

By default, this ``server`` block only contains a simple proxy_pass_ statement
processing all requests via a predefined apache upstream: send everything to
Apache httpd and report back whatever it said.

This configuration can be extended using ":ref:`uberspace web backend set <backends>`"
commands. 

.. code-block:: console
  :emphasize-lines: 14

  [marie@stardust ~]$ uberspace web backend set /etherpad-lite --http --port 51922
  Set backend for /etherpad-lite to port 51922; please make sure something is listening!
  You can always check the status of your backend using "uberspace web backend list".
  [root@stardust ~]# cat /etc/nginx/user.d/marie.conf
  # manged by uberspace-generate-nginx-config

  server {
      (...)

      location / { proxy_pass http://apache; }

      # domain specific backends
      # global backends, minus the ones specified as domain-ones
      location /etherpad-lite { proxy_pass http://100.64.9.2:51922; }
  }

The original configuration has now been extended with a new ``location``/``proxy_pass``
section. By default, all requests are still routed to Apache, but requests
intended for etherpad are passed onto the service directly. This enables you to
get the direct, raw HTTP traffic - including the original headers and WebSocket_
connections.

.. note::

  The curious ``100.64.9.2`` IP address above is due to our networking setup.
  Feel free to :ref:`read up on it <network>`, if you'd like to know more!


Other backend types like ``--static`` or ones specific to a domain work in a
very similar way. They are documented over in the :ref:`web backends <backends>`
article.

httpd
=====

Apache serves requests for more traditional development needs like PHP and
applications requiring ``.htaccess`` files. As you saw in the above examples,
it is reverse proxied using nginx - just like other web backends. Since we try
to handle as much as possible within nginx, which makes our httpd configuration
rather short:

.. code-block:: console
  :emphasize-lines: 3,10,15

  [root@7399782766919198857 ~]# cat /etc/httpd/user.d/dbcheck.conf
  <Directory /var/www/virtual/dbcheck>
  AllowOverride AuthConfig FileInfo Indexes Limit Options=ExecCGI,Includes,Indexes,MultiViews,SymLinksIfOwnerMatch
  Options +Includes
  </Directory>

  <VirtualHost *>
  ServerName dbcheck.uber.space
  SuexecUserGroup dbcheck dbcheck
  DocumentRoot /var/www/virtual/dbcheck/html

  (...)

  <FilesMatch "\.php$">
      SetHandler  "proxy:unix:/run/php-fpm-dbcheck.sock|fcgi://php-fpm-dbcheck"
  </FilesMatch>
  <Proxy "fcgi://php-fpm-dbcheck" max=10></Proxy>
  </VirtualHost>


As mentioned earlier httpd only handles ``.htaccess`` (=> ``AllowOverride``),
static files (=> ``DocumentRoot``) and PHP (=> ``SetHandler``). Since all of
those are rather ordinary duties for httpd, the configuration is rather simple
in this case. Additionally, since everything else is handled within nginx, the
only dynamic parts of this configuration is the list of domains in ``ServerName``
- and the username, of course.

.. note::

  Some probably noticed that static files are handled within httpd, instead of
  nginx. Even through nginx easily outperforms httpd when it comes to serving
  static files, we need to use httpd in this case. Many applications like
  wordpress rely on ``.htaccess`` files to rewrite URLs or protect certain
  directories from being accessed. Since those files can only be parsed by
  httpd, nginx does not qualify for the job.

  We may change this in the future in a backwards-compatible way.

Acknowledgements
================

The ASCII art cloud has been copied from `asciiart.eu <asciicloud_>`_. The
artist goes by the name ``a:f``. Thank you!

.. _nginx: http://nginx.org/
.. _Apache httpd: http://httpd.apache.org/
.. _proxy_pass: http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass
.. _WebSocket: https://en.wikipedia.org/wiki/WebSocket
.. _asciicloud: https://www.asciiart.eu/nature/clouds
