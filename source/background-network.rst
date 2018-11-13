.. _network:

#######
Network 
#######

::

              _
            (`  ).              .---Host:-stardust--.              .-----user@stardust--.
           (     ).             |                   |              |                    |
          _(       '`.          |       veth_user_o >===internal===> veth_user          |
      .=(`( Internet )          |        100.64.9.1 |              |  100.64.9.2        |
      ((    (..__.:'-' ===WAN===> eth0              |              | lo                 |
      `(       ) )              | 185.26.156.62     |              |  127.0.0.1         |
        ` __.:'   )             |                   |              |                    |
               --'              \-------------------/              \--||-----||-----||--/
                                                                      ||     ||     ||
                                                                      \/     \/     \/
  .                                                                 nodejs  nginx  gogs

As is common with hosting providers, your uberspace is outfitted with a more or
less direct connection to the world wide web. It can be used to download all
kinds of things like new software to install on it, or - as you'll probably do
- to provide websites or services to yourself or others.

Receiving data from other servers onto your uberspace works just like it does
on any other linux machine. For example, a simple ``curl https://uberspace.de``
does just what you'd expect:

.. code-block:: console

  [eliza@doolittle ~]$ curl https://uberspace.de
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta name="description" content="Uberspace.de ist deine Plattform für den
  Betrieb von Websites und Mail. Wir bieten ungewöhnlich viele Möglichkeiten,
  engagierte Unterstützung durch erfahrene Linux-Admins - und du suchst dir
  selbst aus, wieviel du dafür zahlst." />
  (...)

Network Namespaces
==================

The sending side of things looks a little different. If you know your way around
standard linux networking tools like ip_ or traceroute_, you might have noticed
a few strange IPs:

.. code-block:: console
  :emphasize-lines: 3,11,13

  [eliza@doolittle ~]$ traceroute uberspace.de
  traceroute to uberspace.de (185.26.156.78), 30 hops max, 60 byte packets
  1  gateway (100.64.9.1)  0.047 ms  0.012 ms  0.011 ms
  2  185.26.156.62 (185.26.156.62)  5.281 ms  5.250 ms  5.660 ms
  3  185.26.15 (...)
  [eliza@doolittle ~]$ ip addr
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    (...)
  3: veth_eliza@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP qlen 1000
    link/ether 1a:25:85:03:bc:3a brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 100.64.9.2/30 scope global veth_dbcheck
       valid_lft forever preferred_lft forever
    inet6 fd75:6272:7370:9::2/64 scope global 
       valid_lft forever preferred_lft forever

These adresses (``100.64.x.y``, ``fed75::xxx::2``) aren't ordinary public ones,
but rather from the IPv6 ULA_ or IPv4 `Carrier-grade NAT`_ ranges. This is
because uberspaces are not directly connected to the internet, but are placed
within their own little `network namespace`_, similarily to how docker handles
networking for its containers. This gives them their own ``veth_...`` interface
and funnily enough, their own loopback / ``127.0.0.1``. Connections to the
outside are then NATed, direct, raw TCP or UDP connections from the internet are
currently not supported.

.. note::

  `Network namespaces <network namespace_>`_ are a feature of the linux kernel.
  In a normal setup there is just a single setup of network interfaces,
  firewall rules and routing tables. Network namespaces change that fundamental
  assumption. With network namespaces, a system can have multiple separate
  instances of network stacks that operate independent of each other. In our
  setup, all services and sessions for a uberspace are placed in their own
  namespace.

Placing each uberspace in their own networking world has a number of advantages:

* Your **networking is seperated**. Even when you run services that open ports,
  other users still cannot connect to them directly, as would be the case on a
  normal linux system.
* **Traffic accounting**. Since each user has their own network interface,
  standard tools can be used to find users causing high amounts of traffic,
  ensuring a safe and comfortable ride for everyone.
* **Mapping of services**. Since every user has their own ``100.64.x.y`` IP
  address, user services can easily be reached via ``100.64.x.y:63141``. This
  enables us to provide cool features like :ref:`web backends <backends>`.

Sidequest: Pluggable authentication modules (PAM)
=================================================

.. note::

  This section expends on the technical implementation of network namespaces in
  our setup. If you only look for a higher-level understanding of the topic, can
  safely skip to the next one.

To make sure our setup actually works, it is very important that all user
sessions, processes and services are started within the right network namespace.
There are many ways to modify the behavior of interactive sessions and a few to
affect 3rd-party systemd services like :ref:`php-fpm <php>` or :ref:`supervisord`.
Eventually we decided on a solution, which can handle both use cases in a single
mechanism: a custom `PAM module <PAM_>`_.

Interactive Sessions
--------------------

While there are lots of possible ways to execute code before or during an
interactive session (``/etc/profile``, sshds ``ForceCommand``, shell wrappers,
...), PAM is comparatively simple. Since all entrypoints like SSH or sudo
already support and use it by default, not a lot of trickery is required here:

.. code-block:: console

  [root@7399782766919198857 ~]# cat /etc/pam.d/sshd
  #%PAM-1.0
  (...)
  # do not ever place root into a network namespace
  session [success=1 default=ignore] pam_succeed_if.so quiet uid eq 0
  session required pam_python.so /lib64/security/pam_netns.py

We utilize pam_python_ to run our very own custom PAM module. It creates the
needed namespace, interfaces and routes on demand and then places the session
within the created namespace. All subsequently started processes simply inherit
it.

systemd Services
----------------

Placing a generic systemd service into a network namespace is trickier. The
`nsenter command`_ can execute a command and pace it into the desired namespace.
There is just one catch: it needs to be executed as root. Since our services
should . PAM is way simpler in this case:

.. code-block:: console

  [root@7399782766919198857 ~]# cat /etc/systemd/system/supervisord@.service
  [Unit]
  Description=Provides a supervisord instance for each user.
  (...)

  [Service]
  ExecStart=/usr/bin/supervisord -c $SUPERVISOR_CONFIG
  (...)
  User=%I
  PAMName=su-l

Systemd provides a `PAMName=`_ directive directive. Together with the rather
popular `User=`_, it executes a process under the right user, while "logging
that user in" using PAM. Exactly what we need. :)

System services
===============

We provide a number of services so you don't have to do everything yourself:
nginx, MySQL, SSH, POP3, IMAP, SMTP and so on. Like any process, these services
can only be in one namespace at a time and that is most certainly not the one of
your uberspace. Sites running in php-fpm or daemons run with supervisord
therefore cannot connect to MySQL on ``127.0.0.0.1:3306``, because there is none
on *their* ``127.0.0.1``. The services can be reached using ``$HOSTNAME:3306``,
but that seems rather inconvenient.

Because we'd like to provide an easy-to-use setup, these services are proxied
into every single namespace using a small Go tool based on googles tcpproxy_
library. Since this is all happening locally, it shouldn't behave differently
than a direct connection. This setup also enables us to move some of those
services off the uberspace hosts onto dedicated machines in the future.

Impact on users
===============

While this architecture shouldn't restrict you in any way (ping us at hallo@uberspace.de,
if it does!), there a few things to watch out for:

* You have your own seperate ``127.0.0.1``. If you services listens on that, it
  is only reachable within your uberspace. If you want to make use of our
  :ref:`web backends <backends>`, be sure to listen on ``0.0.0.0``.
* When using the "classic" ``.htaccess`` method of providing your own web
  services via apache, using ``127.0.0.1`` won't work for similar reasons.
  Please use the newer web backends.

Other than these small caveats, networking on your uberspace should work like it
does on any other machine: happy pinging!

Acknowledgements
================

Parts of the network namespace explaination are adapted from the article
`"Introducing Linux Network Namespaces" <networkns article_>`_ by Scott Lowe.
Thank you!

The ASCII art cloud has been copied from `asciiart.eu <asciicloud_>`_. The
artist goes by the name ``a:f``. Thank you!

.. _ip: https://linux.die.net/man/8/ip
.. _traceroute: https://linux.die.net/man/8/traceroute
.. _Carrier-grade NAT: https://en.wikipedia.org/wiki/Carrier-grade_NAT
.. _ULA: https://en.wikipedia.org/wiki/Unique_local_address
.. _network namespace: https://lwn.net/Articles/580893/
.. _PAM: https://en.wikipedia.org/wiki/PAM
.. _pam_python: http://pam-python.sourceforge.net/
.. _nsenter command: http://man7.org/linux/man-pages/man1/nsenter.1.html
.. _PAMName=: https://www.freedesktop.org/software/systemd/man/systemd.exec.html#PAMName=
.. _USer=: https://www.freedesktop.org/software/systemd/man/systemd.exec.html#User=
.. _tcpproxy: https://github.com/google/tcpproxy
.. _networkns article: https://blog.scottlowe.org/2013/09/04/introducing-linux-network-namespaces/
.. _asciicloud: https://www.asciiart.eu/nature/clouds
