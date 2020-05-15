##################
Uberspace 7 manual
##################

.. image:: _static/images/big-rocket.svg

Uberspace is a hosting platform targeted at people who want to look behind the scenes, do things we didn’t anticipate and generally prefer working with a text-based console. Our objective is to not only host the content you’d like to see on the web, but also to introduce you to Linux and basic shell usage.

----

.. tip:: If you're looking for guides and how to install certain tools like `Ghost <https://lab.uberspace.de/en/guide_ghost.html>`_ and `WordPress <https://lab.uberspace.de/en/guide_wordpress.html>`_ check out the `⚛️ Uberlab <https://lab.uberspace.de/en/>`_!

Version {{ newest_changelog_entry.version }} Changelog:

{{ newest_changelog_entry.text }}

Released {{ newest_changelog_entry.date }}.

For more information see the :doc:`full changelog <changelog>`.

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Your first day

   for newbies <firstday-newbies>
   for Ubernauts <firstday-ubernauts>
   for nerds <firstday-nerds>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Basics

   SSH <basics-ssh>
   SFTP <basics-sftp>
   backup <basics-backup>
   resources <basics-resources>
   home directory <basics-home>
   shell <basics-shell>
   firewall ports <basics-ports>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Web

   DocumentRoot <web-documentroot>
   domains <web-domains>
   https <web-https>
   security headers <web-security-headers>
   web backends <web-backends>
   logs <web-logs>
   Tor <web-tor>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Mail

   access <mail-access>
   domains <mail-domains>
   mailboxes <mail-mailboxes>
   forwarding <mail-forwarding>
   spam filter <mail-spam>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Database

   MySQL <database-mysql>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Programming languages

   PHP <lang-php>
   Python <lang-python>
   NodeJS <lang-nodejs>
   Ruby <lang-ruby>
   golang <lang-golang>
   Rust <lang-rust>
   .NET Core <lang-dotnet>
   Erlang/OTP <lang-erlang>
   Perl <lang-perl>
   Clojure <lang-clojure>
   Java <lang-java>
   GCC / C(++) <lang-gcc>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Daemons

   supervisord <daemons-supervisord>
   Cron jobs <daemons-cron>
   runwhen <daemons-runwhen>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Background

   Network <background-network>
   HTTP Stack <background-http-stack>

.. toctree::
   :hidden:
   :titlesonly:
   :maxdepth: 1
   :caption: Meta

   Changelog <changelog>
   Changelog Archive <changelog_archive>
   ⚛️ Uberlab <https://lab.uberspace.de/en/>
   Legal Notice <https://uberspace.de/imprint>
   Privacy <https://uberspace.de/privacy>
