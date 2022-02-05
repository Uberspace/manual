.. _firewallports:

##############
Firewall Ports
##############

All uberspaces come with default firewall settings, which do not allow incoming
connections on ports other than 443 and 80. Some software like Wordpress,
mailman or seafile can be exposed using :ref:`php-fpm <lang-php>` or
:ref:`web backends <web-backends>`. Either way, you do not need to think about
ports and firewalls.

If your software requires direct TCP or even UDP connections, like XMPP, ZNC or
mosh, you need to open a port in the firewall.

.. note:: If you plan to use :ref:`web backends <web-backends>`, you do **not** need to open a port for your application.

Opening ports
=============

Each uberspace can open 20 ports. The port numbers are generated automatically
in the range from 20.000 to 61.000 and cannot be chosen arbitrarily.

.. code-block:: bash

 [isabell@stardust ~]$ uberspace port add
 Port 40132 will be open for TCP and UDP traffic in a few minutes.

.. tip:: Your application needs to listen on interface ``::`` or ``0.0.0.0`` (using ``127.0.0.1``, ``localhost``, ``::1``, the external IP, or the hostname will **not** work).

Listing Ports
=============

To get a list of currently open ports, execute the following command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace port list
 40132
 40133
 40134

Closing Ports
=============

If you don't need your port anymore, it's a good idea to close it. You can do so
using to following command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace port del 40132
 Port 40132 will be closed in a few minutes.
