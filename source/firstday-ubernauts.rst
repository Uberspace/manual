.. _firstday-ubernauts:

.. note::
  Looking to move from Uberspace 6 to Uberspace 7 and dont know how to do? Please refer to the `Uberspace 6 documentation <https://wiki.uberspace.de/uberspace2uberspace>`_. It is currently only available in German. If you need any help, please do not hesitate to contact us!

  Möchtest du von Uberspace 6 auf Uberspace 7 umziehen und weißt noch nicht wie? Wirf einen Blick in die `Uberspace 6 Dokumentation <https://wiki.uberspace.de/uberspace2uberspace>`_. Solltest du dabei Unterstützung brauchen, melde dich gerne bei uns!

#######################################
Your first day... for Ubernauts from U6
#######################################

Congratulations! You have just finished your move from Uberspace 6 to Uberspace 7, or you are still in the process of migration? Ok however, here you can check what changes you will encounter after migration.


Web Domains
===========

- On U7 you will have a new short and nice default domain, independent from your current host: **https://isabell.uber.space** (where ``isabell`` is your username).

- Your U6 domains like ``https://julia.amnesia.uberspace.de`` will no longer be available because you moved to another host and it is no longer possible to use this domain scheme even for U7 hosts.

- You can add subdomains like ``https://sub.isabell.uber.space`` to your default domain but in difference to U6, you still need to :ref:`add them <web-domains>` to your Uberspace account.

- It is no longer possible to use wildcard subdomains, you have to add each domain like ``www.example.com`` or ``cloud.example.com`` separately.

- You will not have to take care for HTTPS/TLS or Lets Encrypt certificates, everything is :ref:`fully automated <web-https>` and all web connections are encrypted.

- You will have a :ref:`Tor Onion Service web address <web-tor>` for your account.


Mailing
=======

- According to your new default domain, you also have an adequate default email address: **isabell@uber.space** (where ``isabell`` is your username).

- You will have to change the mailserver address to your new U7 host when you are using mail clients like Thunderbird. Your DNS MX must be adjusted to the new host before beeing able to login to your postbox.

- Webmail for U7 is available at the central web address `https://webmail.uberspace.de <https://webmail.uberspace.de>`_. It is no longer possible to use an addressbook at this webmailer, therefore please install your own client from the `Uberspace Lab <https://lab.uberspace.de/tags/webmail>`_.

- Regarding spam management, DSPAM und SpamAssassin is currently not available on U7, training the spam filter with `ham` and `spam` is not possible for users yet. Check the manual page for current :ref:`spam management <mailfilters>`.

- There is no longer native support for domain namespaces, each mail user will work with every connected mail domain, to avoid this you have to create separate uberspace accounts for each domain.


Logging and Debugging
=====================

- Logging is disabled by default and you have to :ref:`enable <web-logs>` different types of logs.

- We show a generic :ref:`Error 500 errorpage <web-errorpage>` with some informations how to debug, you can disable this page if you like.


Databases
=========

- There is now a central instance for Adminer at `https://mysql.uberspace.de/adminer <https://mysql.uberspace.de/adminer>`_

- MariaDB is now our default MySQL databaes, if you have used MariaDB on U6 with an external server you will probably need to update the port in your app configs.

- If you want to use a PostgreSQL database, you have to install it yourself following the `guide <https://lab.uberspace.de/guide_postgresql.html>`_ in our lab.


Miscellaneous
=============

- If we had opened a port for your software on U6, you may not be able to get the same port again on U7. You can open random ports by your own, see :ref:`opening ports <basic-ports>`.

- We no longer support outdated software like CGI, PHP5 etc. on U7. You may be able to get these run by installing and setting them up yourself but we cannot support you with problems in doing so.

- Instead of fiddling with your ``.htaccess`` to redirect to your listening services, you now manage this job much better using our :ref:`web backends <backends>`.

- Services are now controlled and restarted by ``supervisord`` instead of the ``daemontools``, check out the :ref:`manual page <supervisord>` to see how you can set up your services on U7.


New features
=============

- You can :ref:`upgrade your storage <billing>` and use more storage space than the default 10GB.

- There are lots and lots of clear and simple guides in our `Lab <https://lab.uberspace.de>`_ that help and inspire you to install apps on your new U7.

- You can now set your custom :ref:`web headers <headers>` for all web connections.

- Managing your uberspace on the command line is now done via our pretty uberspace commands like ``uberspace web domain add example.com``.

- And last but not least, this `Manual <https://manual.uberspace.de>`_ is the documentation for all your Uberspace features and management. We keep it straight and clear and you can always contribute to it on `Github <https://github.com/uberspace/manual>`_. Issues and Pull Requests are very welcome.