.. _web-tor:

##################
Tor Hidden Service 
##################

Tor_ is open-source software for anonymous communication. It enables users
behind the firewall of their ISP or country to access to the wider internet and
can thus act as a very empowering tool. Additionally, it hides browsing behavior
from your ISP or whoever else is listening in on your connection. To enable
this, traffic is routed through several nodes within the Tor network, which also
makes surfing a bit slower.

While Tor is quite capable of connecting Tor users to the outside world via
so-called exit nodes, there is a much nicer way to access content inside Tor:
hidden services. Traffic to and from Tor hidden services never leaves the Tor
network and, as a result, has stronger privacy guarantees as well as increased
performance. It also enabled both the server and the client to remain anonymous.

Content hosted on the default ``.uber.space`` domain is automatically made
available as a hidden service as a sub domain of **onastroids**\ t6krpn.onion.
For example, content on https://isabell.uber.space is also reachabe via
http://isabell.onastroidst6krpn.onion.

Forwarding by Tor-Browser
=========================

If provided an ``Onion-Location`` will cause the Tor-Browser to `redirect according to the settings https://tb-manual.torproject.org/onion-services/`.
Currently you may manually setup the ``Onion-Location`` as HTTP header using ``uberspace web header set / Onion-Location http://SOMEONE.ahcbagldgzdpa74g2mh74fvk5zjzpfjbvgqin6g3mfuu66tynv2gkiid.onion/``, for more details see https://manual.uberspace.de/web-headers.html .
An alternative possibility that also overrides the HTTP header is a meta-tag in the header https://community.torproject.org/onion-services/advanced/onion-location/, e.g. in case the content is shared with other webservers than uberspace.

Other domains
=============

Content on other domains is currently not accessible as a hidden service, but
can of course be accessed normally from inside the Tor network. This is mainly
due a difficulty in matching requests: all requests from
``SOMEONE.onastroidst6krpn.onion`` go to ``SOMEONE.uber.space``, which makes
for a rather simple and roboust setup. While we could implement more
sophisticated matching like ``my.domain.com.SOMEONE.onastroidst6krpn.onion``, we
have currently chosen not do so.

You can of course host your own hidden service inside your uberspace to serve
other content.

Trust and Security
==================

Compared to a normal hidden service run by yourself, there are a few key points
to keep in mind:

1. Your username is contained in the site domain, which makes it clear, who is
   responsible for the provided content. Since uberspace only allows legal
   content to be hosted on our servers, this should not be of much concern to most
   users. In some cases, you might benefit from the extra anonymity, though. If
   this sounds like you, a different solution might be a better fit.
2. We hold the private key to our onion address and could thus theoretically alter
   or drop any content or requests. We will of course not do so; with a notable
   exception being abuse handling. While this is rather obvious, we still wanted
   to point it our here.
3. Our hidden service currently only supports HTTP (without the S). Since the
   traffic never leaves the Tor network, this isn't much of a problem. We'd like
   to provide HTTPS anyway, since it would provide additional authentication, but we
   are currently not able to do so. This is mainly due to high pricing of
   certificates for ``.onion`` domains as well as Let's Encrypt not supporting
   them.

If any of those points constitute a deal breaker for you, you are of course free
to not use our hidden service and host your own inside your uberspace.

Identifying Requests
====================

Tor makes it impossible to identify which source IP address is sending requests
to your site. This is by design. Without some extra effort, it isn't even
obvious that a request passed through the Tor network at all. However, requests
that arrived on our hidden service and where then proxied through to your
uberspace bear a ``X-Uberspace-Via-Hidden-Service`` HTTP header. Keep in mind
that this header can be faked very easily. Requests containing the header might
come from the hidden service. Requests not containing the header certainly did
not pass through the hidden service.

Next-Gen/V3 Onions
==================

Since V2 onions and their SHA1/RSA1024 tech is a little dated, we also offer a
V3 onion address: ``ahcbagldgzdpa74g2mh74fvk5zjzpfjbvgqin6g3mfuu66tynv2gkiid.onion``.
It can be used just like the V2 one.

uberspace.de
============

Just like your sites, our website and the dashboard can of course be directly
accessed in the Tor network. Use the following addresses:

* http://uberspaceyukm42r.onion
* http://ubrspc3z5xuzh2iss4xuacpjdqj24orwnuye5hk23cpykd3mcujvygqd.onion

.. _Tor: https://www.torproject.org/
