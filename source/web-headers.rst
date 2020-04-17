.. _headers:

###########
web headers
###########

Use the following commands to send HTTP headers to your clients. You can use it to add your own headers like ``X-Clacks-Overhead: GNU Terry Pratchett`` or add a ``Content-Security-Policy``. They can also be used to override or remove the :ref:`security headers <web-security-headers>` we set by default.

Overview
========

All header commands can be found grouped under ``uberspace web header``:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header
  TODO: help

In case you get stuck or want to know what's going on, you can always use ``web header list`` to get the big picture:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header list
  /
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=172800
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block

The command displays the current configuration as entered.

Adding headers and inheritance
==============================

New headers can be added using the `header set` command:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header set /blog X-Clacks-Overhead "GNU Terry Pratchett"
  Set header "X-Clacks-Overhead: GNU Terry Pratchett" for /blog

Again, you can take a look using `header list`:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header list
  /blog
    X-Clacks-Overhead: GNU Terry Pratchett
  /
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=172800
    (...)

Much like :ref:`web backends <backends>` a header is present on the set path plus all of the paths below. This means the ``X-Clacks-Overhead`` header set on ``/blog`` header will also be present on ``/blog/imprint``, ``/blog/archive/1984`` and so on:

.. code-block:: console

  [isabell@philae ~]$ curl -I https://isabell.uber.space/blog | grep X-Clacks-Overhead
  X-Clacks-Overhead: GNU Terry Pratchett
  [isabell@philae ~]$ curl -I https://isabell.uber.space/blog/imprint | grep X-Clacks-Overhead
  X-Clacks-Overhead: GNU Terry Pratchett
  [isabell@philae ~]$

However, it will not show up on ``/`` or any other unrelated URL like ``/etherpad``:

.. code-block:: console

  [isabell@philae ~]$ curl -I https://isabell.uber.space | grep X-Clacks-Overhead
  [isabell@philae ~]$ curl -I https://isabell.uber.space/etherpad | grep X-Clacks-Overhead
  [isabell@philae ~]$

Removing headers
================

Headers you added using ``set`` can be deleted using ``del``:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header del /blog X-Clacks-Overhead
  Deleted header "X-Domain-Header" for /blog

Clearing headers from parent paths
==================================

Assume ``web header add /blog X-Frame-Options DENY`` was used to not allow ``/blog`` to be framed. If you'd now like to allow the sub directory ``/blog/iframe`` to be allowed as a frame on some other site, use ``web header suppress``:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header set /blog X-Frame-Options DENY
  [isabell@philae ~]$ uberspace web header suppress /blog/iframe X-Frame-Options
  Suppressing header "X-Frame-Options" for /blog/iframe
  [isabell@philae ~]$

Again, you can take a look using `header list`:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header list
  /blog/iframe
    X-Frame-Options: (suppressed)
  /blog
    X-Frame-Options: DENY
  /
    Referrer-Policy: strict-origin-when-cross-origin
    Strict-Transport-Security: max-age=172800
    (...)

As instructed the header is now present on ``/blog`` but not on ``/blog/iframe``:

.. code-block:: console

  [isabell@philae ~]$ curl -I https://isabell.uber.space/blog | grep X-Frame-Options
  X-Frame-Options: DENY
  [isabell@philae ~]$ curl -I https://isabell.uber.space/blog/iframe | grep X-Frame-Options
  [isabell@philae ~]$

Default security headers
========================

Your space comes with a number of :ref:`security headers <web-security-headers>` set by default. While these from a solid base for your projects, you may want to extend or remove them.

Removing security headers
-------------------------

Just like any header you set yourself, the default headers can be removed using ``web header del``:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header del / Strict-Transport-Security
  Deleted header "Strict-Transport-Security" for /
  [isabell@philae ~]$ uberspace web header list
  /
    Referrer-Policy: strict-origin-when-cross-origin
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Xss-Protection: 1; mode=block

Like any invisible thing, ``Strict-Transport-Security`` is a bit hard too see in the output, but it's really gone.

Replacing security headers
--------------------------

Headers of inner directories always override the ones set in outer ones. So you can replace the default security headers using ``web header set`` ...

... for a sub path:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header set /blog Strict-Transport-Security "max-age=31536000"
  Set header "Strict-Transport-Security: max-age=31536000" for /blog

... or everything in your space:

.. code-block:: console

  [isabell@philae ~]$ uberspace web header set / Strict-Transport-Security "max-age=31536000"
  Set header "Strict-Transport-Security: max-age=31536000" for /
