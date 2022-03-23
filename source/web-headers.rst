###########
web headers
###########

Use the following commands to send HTTP headers to your clients. You can use it to add your own headers like ``X-Clacks-Overhead: GNU Terry Pratchett`` or add a ``Content-Security-Policy``. They can also be used to override or remove the :doc:`security headers <web-security-headers>` we set by default.

Overview
========

All header commands can be found grouped under ``uberspace web header``:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header

  Manage which HTTP headers are sent to your clients.

  Possible commands:
    del - Remove or unsuppress HTTP header for a given domain and path.
    list - List all configured HTTP headers.
    set - Set HTTP header for a given domain and path.
    suppress - Suppress HTTP header that was inherited from a parent path.

In case you get stuck or want to know what's going on, you can always use ``web header list`` to get the big picture:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header list
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block

The command displays the current configuration as entered. The "Default Headers" section lists headers set by us. They can be overridden or suppressed in your configuration, but their base value cannot be changed. We take care of updating these to keep up-to-date.

Adding headers and inheritance
==============================

New headers can be added using the `header set` command:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set /blog X-Clacks-Overhead "GNU Terry Pratchett"
  Set header "X-Clacks-Overhead: GNU Terry Pratchett" for /blog

Again, you can take a look using `header list`:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header list
  /blog
    X-Clacks-Overhead: GNU Terry Pratchett
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    (...)

Much like :doc:`web backends <web-backends>` a header is present on the set path plus all of the paths below. This means the ``X-Clacks-Overhead`` header set on ``/blog`` header will also be present on ``/blog/imprint``, ``/blog/archive/1984`` and so on:

.. code-block:: console

  [isabell@stardust ~]$ curl -I https://isabell.uber.space/blog | grep X-Clacks-Overhead
  X-Clacks-Overhead: GNU Terry Pratchett
  [isabell@stardust ~]$ curl -I https://isabell.uber.space/blog/imprint | grep X-Clacks-Overhead
  X-Clacks-Overhead: GNU Terry Pratchett
  [isabell@stardust ~]$

However, it will not show up on ``/`` or any other unrelated URL like ``/etherpad``:

.. code-block:: console

  [isabell@stardust ~]$ curl -I https://isabell.uber.space | grep X-Clacks-Overhead
  [isabell@stardust ~]$ curl -I https://isabell.uber.space/etherpad | grep X-Clacks-Overhead
  [isabell@stardust ~]$

Targeting
=========

Exactly like :doc:`web backends <web-backends>` a header can be set on a path, domain or both to ...

... make the header appear on a domain only:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set terryfanpage.org/ X-Clacks-Overhead "GNU Terry Pratchett"
  Set header "X-Clacks-Overhead: GNU Terry Pratchett" for terryfanpage.org/

... make the header appear on a domain within a given path only:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set terryfanpage.org/blog X-Clacks-Overhead "GNU Terry Pratchett"
  Set header "X-Clacks-Overhead: GNU Terry Pratchett" for terryfanpage.org/blog

... in a sub path on any domain:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set /blog X-Clacks-Overhead "GNU Terry Pratchett"
  Set header "X-Clacks-Overhead: GNU Terry Pratchett" for /blog

... or just everywhere:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set / X-Clacks-Overhead "GNU Terry Pratchett"
  Set header "X-Clacks-Overhead: GNU Terry Pratchett" for /

Removing headers
================

Headers you added using ``set`` can be deleted using ``del``:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header del /blog X-Clacks-Overhead
  Deleted header "X-Domain-Header" for /blog

Clearing headers from parent paths
==================================

Assume ``web header add /blog X-Frame-Options DENY`` was used to not allow ``/blog`` to be framed. If you'd now like to allow the sub directory ``/blog/iframe`` to be allowed as a frame on some other site, use ``web header suppress``:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set /blog X-Frame-Options DENY
  [isabell@stardust ~]$ uberspace web header suppress /blog/iframe X-Frame-Options
  Suppressing header "X-Frame-Options" for /blog/iframe
  [isabell@stardust ~]$

Again, you can take a look using `header list`:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header list
  /blog/iframe
    X-Frame-Options: (suppressed)
  /blog
    X-Frame-Options: DENY
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    (...)

As instructed the header is now present on ``/blog`` but not on ``/blog/iframe``:

.. code-block:: console

  [isabell@stardust ~]$ curl -I https://isabell.uber.space/blog | grep X-Frame-Options
  X-Frame-Options: DENY
  [isabell@stardust ~]$ curl -I https://isabell.uber.space/blog/iframe | grep X-Frame-Options
  [isabell@stardust ~]$

To reverse this, use ``web header del``:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header del /blog/iframe X-Frame-Options
  Unsuppressed header "X-Frame-Options" for /blog/iframe
  [isabell@stardust ~]$

Which causes to header to appear again:

.. code-block:: console

  [isabell@stardust ~]$ curl -I https://isabell.uber.space/blog/iframe | grep X-Frame-Options
  X-Frame-Options: DENY
  [isabell@stardust ~]$

Default security headers
========================

Your space comes with a number of :doc:`security headers <web-security-headers>` set by default. While these from a solid base for your projects, you may want to extend or remove them.

Removing security headers
-------------------------

Just like any header you set yourself, the default headers can be suppressed using ``web header suppress``:

.. code-block:: console
  :emphasize-lines: 1,5

  [isabell@stardust ~]$ uberspace web header suppress / Strict-Transport-Security
  Deleted header "Strict-Transport-Security" for /
  [isabell@stardust ~]$ uberspace web header list
  /
    Strict-Transport-Security: (suppressed)
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block

Replacing security headers
--------------------------

Headers of inner directories always override the ones set in outer ones. So you can replace the default security headers using ``web header set`` ...

... for a sub path:

.. code-block:: console
  :emphasize-lines: 1,5

  [isabell@stardust ~]$ uberspace web header set /blog Strict-Transport-Security "max-age=63072000"
  Set header "Strict-Transport-Security: max-age=63072000" for /blog
  [isabell@stardust ~]$ uberspace web header list
  /blog
    Strict-Transport-Security: max-age=63072000
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block

... or everything in your space:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set / Strict-Transport-Security "max-age=63072000"
  Set header "Strict-Transport-Security: max-age=63072000" for /

Restoring security headers
--------------------------

If you removed or replaced security headers in the past and would like to restore the default, use ``web header del``:

.. code-block:: console
  :emphasize-lines: 3,4,11,13

  [isabell@stardust ~]$ uberspace web header list
  /
    Strict-Transport-Security: max-age=63072000
    X-Frame-Options: (suppressed)
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block
  [isabell@stardust ~]$ uberspace web header del / Strict-Transport-Security
  Deleted header "Strict-Transport-Security" for /
  [isabell@stardust ~]$ uberspace web header del / X-Frame-Options
  Unsuppressed header "X-Frame-Options" for /
  [isabell@stardust ~]$ uberspace web header list
  Default Headers:
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=31536000
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block

Examples
========

Disable Google's FLoC
---------------------

As anounced in April of 2021, Google is moving to use a new technology called FLoC to track users across the web. To disable FLoC for a website, you can add a ``Permissions-Policy`` header:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web header set / Permissions-Policy "interest-cohort=()"
  Set header "Permissions-Policy: interest-cohort=()" for /
