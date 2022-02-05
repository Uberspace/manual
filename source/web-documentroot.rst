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

.. tip:: The ``DOCUMENT_ROOT`` variable set by Apache *always* points to the one and only DocumentRoot ``/var/www/virtual/<username>/html`` so you will get a misleading value. There is no way to change that behaviour.

.. warning:: Do not delete ``/var/www/virtual/<username>/html``. If this folder doesn't exist, the RewriteRules implementing the additional DocumentRoots don't work, so all your domains will be inaccessible.

Example how to change DocumentRoot location
-------------------------------------------

Many PHP apps like Symfony provide their own public webfolder within their folder structure. It is recommended to only make this folder accessible by the webserver. This can be achieved, for example, with the following procedure:

.. code-block:: console

  # in /var/www/virtual/$USER
  [isabell@stardust isabell]$ rm -f html/nocontent.html
  [isabell@stardust isabell]$ rmdir html
  [isabell@stardust isabell]$ mkdir -p my_project/public
  [isabell@stardust isabell]$ ln -s my_project/public html

this will result in the following structure:

.. code-block:: console
  
  [isabell@stardust isabell]$ tree
  .
  ├── html -> my_project/public
  └── my_project
      └── public

because ``my_project`` is not a domain name that can be reached by the webserver, the source code will never be reachable from the outside.

Permissions
===========

Since the webserver runs with a different user, you need to make sure your files have the right `permissions <https://en.wikipedia.org/wiki/Chmod>`_. The folder ``/var/www/virtual/<username>/html`` and all additional DocumentRoots need to have mode ``0755``, the files within ``0644``. To fix this for all files and folders you can use the following code:

.. code-block:: console

  [isabell@stardust ~]$ chmod -R u=rwX,go=rX ~/html

.. tip:: Since the folder ``/var/www/virtual/<username>`` has mode ``0750``, other users on the same server can't access your files.

In addition to "traditional" permission bits, uberspace uses `SELinux <https://en.wikipedia.org/wiki/Security-Enhanced_Linux>`_. For the webserver user to be able to access the files, they need to have a SELinux type of ``httpd_sys_content_t``. If you create files in your home directory, those files will carry the ``user_home_t`` type instead. Using ``mv`` to move the files will take care of this, as ``mv`` is aliased to ``mv -Z`` by default (``-Z``: *set SELinux security context of destination file to default type*). However, if you move your files in a different way, you might need to set the SELinux label accordingly, for example using `restorecon <https://linux.die.net/man/8/restorecon>`_: 

.. code-block:: console

  [isabell@stardust ~]$ restorecon -R -v ~/html

Configuration
=============

Provided configuration
----------------------

We provide the following configuration:

.. code-block:: ini

  DirectoryIndex index.html index.htm index.html.var index.php index.cgi index.sh nocontent.html
  TypesConfig /etc/mime.types
  AddType application/x-compress .Z
  AddType application/x-gzip .gz .tgz
  AddType text/html .shtml
  AddType application/wasm .wasm .wasm.gz .wat .wat.gz
  AddOutputFilter INCLUDES .shtml

The full configuration ist provided within the file ``/etc/httpd/conf/httpd.conf`` which is readable by every user.

Own configuration
-----------------
.. _htaccess:

You can provide your own configuration with ``.htaccess`` files. Check the `Directive Quick Reference <http://httpd.apache.org/docs/2.4/mod/quickreference.html>`_ for possible configuration directives. Keep in mind that the third column needs to contain ``h`` for ``.htaccess``.
