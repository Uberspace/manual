.. _mail-access:

####################
Accessing Your Mails
####################

Webmail
=======

You can access your emails using the webmail interface at `webmail.uberspace.de <https://webmail.uberspace.de>`_. Use your full email address and the corresponding password to login. This works with your ``@uber.space`` address as well as with any addresses using your :ref:`own domains <mail-domains>`.

For your ``@uber.space`` address the password is the same as for SSH access, which you can set in your `dashboard <https://dashboard.uberspace.de/dashboard/authentication>`_.

.. warning:: If you never set your password for SSH access it won't be possible to authenticate with the ``@uber.space`` address. You have to explicitly set the password for SSH access once after you have created your uberspace account.

Client settings
===============

.. warning:: You must use encryption with all of the protocols; we do not support insecure access.

IMAP
----

+--------------------+----------------------------------------------+
|Server              | :term:`your Hostname`                        |
+--------------------+----------------------------------------------+
|Port                | ``993``                                      |
+--------------------+----------------------------------------------+
|SSL/TLS Encryption  | Enabled, but not STARTTLS                    |
+--------------------+----------------------------------------------+
|Username            | Your email address, including the domain     |
+--------------------+----------------------------------------------+
|Password            | Your password for the email address          |
+--------------------+----------------------------------------------+

.. tip:: If your mail client does not support TLS encryption, use port ``143`` instead with STARTTLS.

POP
---

We recommend using IMAP over POP to access your email. By default, POP will pull emails from your inbox.

+--------------------+----------------------------------------------+
|Server              | :term:`your Hostname`                        |
+--------------------+----------------------------------------------+
|Port                | ``995``                                      |
+--------------------+----------------------------------------------+
|SSL/TLS Encryption  | Enabled, but not STARTTLS                    |
+--------------------+----------------------------------------------+
|Username            | Your email address, including the domain     |
+--------------------+----------------------------------------------+
|Password            | Your password for the email address          |
+--------------------+----------------------------------------------+

.. tip:: If your mail client does not support TLS encryption, use port ``110`` instead with STARTTLS.

SMTP
----

+--------------------+---------------------------------------------+
|Server              | :term:`your Hostname`                       |
+--------------------+----------------------+----------------------+
|Port                | ``587``              | ``465``              |
+--------------------+----------------------+----------------------+
|SSL/TLS Encryption  | STARTTLS             | TLS                  |
+--------------------+----------------------+----------------------+
|Username            | Your email address, including the domain    |
+--------------------+---------------------------------------------+
|Password            | Your password for the email address         |
+--------------------+---------------------------------------------+

.. warning:: Don't use ports ``25`` for sending mails! Unfortunately many clients try to use these ports, this won't work on Uberspace.

Debugging
=========

The most common problems when using a mail client with an Uberspace account:

* Some home routers, especially some *Speedport* models offered by Deutsche Telekom, block SMTP connections to servers that are not on an internal allow list. You need to either disable that feature or add your Uberspace host to the allow list. Please check your router's manual for instructions.
* Similarly, some anti-virus applications block SMTP connections or modify the port.
* Some mail clients won't allow mail passwords that are longer than 16 characters.

Apple Mail.app
--------------

If Mail.app complains that the Account or the SMTP server is offline, this is usually caused by the `Automatically manage connection settings <https://support.apple.com/en-us/HT204208>`_ option. If this option is active, Apple Mail sometimes replaces the correct settings with incorrect ones, blocking access to the account. You can safely turn off the setting and correct the settings.

----

.. glossary::

    your Hostname
      You can find your hostname in the `Datasheet <https://uberspace.de/dashboard/datasheet>`_ section. It's always ``<something>.uberspace.de``.
