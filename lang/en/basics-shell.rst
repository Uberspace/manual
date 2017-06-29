#########
The Shell
#########

A shell is the user interface used to control an operating system. Uberspace relies on a command-line interface (CLI) rather than a graphical user interface (GUI).

Changing the Shell
==================

By default, all new Uberspace accounts use the `Bash <https://www.gnu.org/software/bash/>`_ shell. You can use the ``chsh`` command to switch to a different shell:

.. code-block bash ::
 [eliza@doolittle ~]$ chsh --shell /bin/zsh 
 Changing shell for eliza.
 Shell changed.

List Available Shells
=====================

To find out which shells are available on Uberspace, run ``chsh -l``:

.. code-block bash ::
 [eliza@doolittle ~]$ chsh -l
 /bin/sh
 /bin/bash
 /sbin/nologin
 /usr/bin/sh
 /usr/bin/bash
 /usr/sbin/nologin
 /usr/bin/tmux
 /bin/zsh

