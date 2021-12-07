.. _firstday-website:

###########################
Eine statische Website erreichbar machen
###########################

Ziel:
=====

Du hast:
- einen Account isabell auf dem Server stardust

Du willst:
- Hello World HTML Seite ist über user.uber.space erreichbar


Verbinden über SFTP
------------------

FileZilla Client: https://filezilla-project.org/download.php?type=client

Check Key: https://dashboard.uberspace.de/dashboard/datasheet

.. image:: _static/images/firstday_sftp_filezilla_key.png
  :alt: Alternative text

.. image:: _static/images/firstday_sftp_filezilla.png
  :alt: Alternative text

create and upload a simple html file:

.. code-block:: html

   <html>
    <head>
    </head>
    <body>
     <h1>Hello World<h1>
    </body>
   </html>

save as index.html

upload

visit website in browser

.. image:: _static/images/firstday_website_hello_world.png
  :alt: Alternative text
