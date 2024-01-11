#########
The Shell
#########

A shell is the user interface used to control an operating system. Uberspace relies on a command-line interface (CLI) rather than a graphical user interface (GUI).

Changing the Shell
==================

By default, all new Uberspace accounts use the `Bash <https://www.gnu.org/software/bash/>`_ shell. You can use the ``chsh`` command to switch to a different shell:

.. code-block:: bash

 [isabell@stardust ~]$ chsh --shell /bin/zsh
 Changing shell for isabell.
 Shell changed.

List Available Shells
=====================

To find out which shells are available on Uberspace, run ``chsh -l``:

.. code-block:: bash

  [isabell@stardust ~]$ chsh -l
  /bin/sh
  /bin/bash
  /usr/bin/sh
  /usr/bin/bash
  /usr/bin/fish
  /bin/zsh
  /bin/tmux
  /bin/ksh
  /bin/rksh
  /bin/tcsh
  /bin/csh
  /usr/bin/pwsh


