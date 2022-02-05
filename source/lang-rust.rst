.. _rust:

.. sidebar:: Logo

  .. image:: _static/images/logo_rust.svg
      :align: center

####
Rust
####

Introduction
============

.. warning:: Rust applications belong in your :ref:`home`, **not** in your :ref:`docroot`.

`Rust <https://www.rust-lang.org/>`_ is a *multi-paradigm programming language* focused on **performance** and **safety**, especially **safe concurrency**. Rust is syntactically similar to C++, but provides memory safety without using garbage collection. The compiler is *free and open-source software* dual-licensed under the **MIT License** and **Apache License 2.0**.

Versions
========

Release Types
-------------

The Rust project uses a concept called ‘`release channels <https://doc.rust-lang.org/1.28.0/book/first-edition/release-channels.html>`_’ to manage releases. For now we support the ``stable`` channel.

Crates
======

Packaged Rust projects are called **crates**. The `crates.io <https://crates.io/>`_ website serves as an official repository for them. You can install binaries from there with the `cargo install`_ command:

.. code-block:: console

  [isabell@stardust ~] cargo install package-name

This downloads the source for ``package-name`` and compiles it. The resulting binaries are placed into ``$HOME/.cargo/bin/``. Which is already included in your ``$PATH`` (unless you changed our default setup). You can find ways to configure this in the documentation for `cargo install`_.

.. _`cargo install`: https://doc.rust-lang.org/cargo/commands/cargo-install.html

Connection to webserver
=======================

.. include:: includes/web-backend.rst
