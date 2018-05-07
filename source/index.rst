##################
Uberspace 7 manual
##################

.. image:: _static/images/big-rocket.svg

Uberspace is a hosting platform targeted at people who want to look behind the scenes, do things we didn’t anticipate and generally prefer working with a text-based console. Our objective is to not only host the content you’d like to see on the web, but also to introduce you to Linux and basic shell usage.

----

.. note:: We're working on implementing (in no specific order) erlang, PostgreSQL, CouchDB, MongoDB, backups, custom backends instead of apache, open ports in the firewall, gitolite, redis, ...

Version {{ newest_changelog_entry.version }} Changelog:
============================

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

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Web

   DocumentRoot <web-documentroot>
   domains <web-domains>
   security <web-security>
   custom backends <web-backends>
   logs <web-logs>

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Mail

   access <mail-access>
   domains <mail-domains>
   SPAM <mail-spam>
   mailboxes <mail-mailboxes>
   filtering <mail-filter>

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
   .NET Core <lang-dotnet>

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
   :caption: Meta

   Changelog <changelog>
   👩‍🔬 Uberlab <https://lab.uberspace.de/en/>

