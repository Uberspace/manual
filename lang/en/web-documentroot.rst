.. _docroot:

############
DocumentRoot
############

Publish
=======

In order for a website to be accessible to visitors, it must be published to the correct directory. :ref:`Upload your files via SFTP <sftp>` and place them in ``/var/www/virtual/<username>/html``. Access the files via :ref:`your domain <web-domains>`.

.. _additionaldocroot:

Additional DocumentRoots
------------------------

.. warning:: We strongly suggest to use different accounts for different projects due to security reasons. If one of the DocumentRoots gets compromised (e.g. because of a `CVE <http://www.cvedetails.com/product/4096/Wordpress-Wordpress.html?vendor_id=2337>`_), all other files within all other DocumentRoots can be compromised as well.

You can create folders (and symlinks) in the form of ``/var/www/virtual/<username>/<domain>``. Make sure :ref:`your domain <web-domains>` is setup and configured correctly. To use ``RewriteRules``, you have to create a :ref:`.htaccess file <htaccess>` within the DocumentRoot with the following content:

.. code-block:: ini

  RewriteBase /

Permissions
===========

Since the webserver runs with a different user, you need to make sure your files have the right `permissions <https://en.wikipedia.org/wiki/Chmod>`_. The folder ``/var/www/virtual/<username>/html`` and all additional DocumentRoots need to have mode ``0755``, the files within ``0644``.

.. tip:: Since the folder ``/var/www/virtual/<username>`` has mode ``0750``, other users on the same server can't access your files.

Configuration
=============

Provided configuration
----------------------

We provide the following configuration:

.. code-block:: ini

  DirectoryIndex index.html index.htm index.html.var index.php index.php5 index.cgi index.sh
  TypesConfig /etc/mime.types
  AddType application/x-compress .Z
  AddType application/x-gzip .gz .tgz
  AddType text/html .shtml
  AddOutputFilter INCLUDES .shtml

Own configuration
-----------------
.. _htaccess:

You can provide your own configuration with ``.htaccess`` files. Check the `Directive Quick Reference <http://httpd.apache.org/docs/2.4/mod/quickreference.html>`_ for possible configuration directives. Keep in mind that the third column needs to contain ``h`` for ``.htaccess``.
