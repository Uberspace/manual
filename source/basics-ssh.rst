###
SSH
###

Unlike other providers, the native way create things and work on your Uberspace is the command-line via SSH. If you are inexperienced how to use this,
please first head over to our `SSH HOWTO <https://lab.uberspace.de/howto_ssh.html>`_.


Connection basics
=====================

You can connect to your Uberspace with a basic ``ssh`` command:

.. code-block:: console

  localuser@localhost ~ $ ssh USERNAME@HOSTNAME.uberspace.de

- the ``USERNAME`` is the name of your Uberspace you have chosen when you registered.
- the ``HOSTNAME`` is the name of the server where your Uberspace is located, look it up on your `datasheet <https://dashboard.uberspace.de/dashboard/datasheet>`_.

This would result with our example user in:

.. code-block:: console

  localuser@localhost ~ $ ssh isabell@stardust.uberspace.de

.. _ssh-password:

by Password
-----------

You will need to set up a SSH password on the `dashboard logins <https://dashboard.uberspace.de/dashboard/authentication>`_ page before your first connection.

.. note::

  There is no SSH password set by default. If you want to remove it after you have set it up once, you need to `contact <mailto:hallo@uberspace.de>`_ us.
  Use SSH keys from the start to avoid this.


by SSH keys
-----------

Instead of using a password, you should better authenticate via SSH keys. If you are inexperienced with this, you can lookup our
`SSH keys HOWTO <https://lab.uberspace.de/howto_ssh-keys.html>`_.

You can add a public key using the `dashboard logins <https://dashboard.uberspace.de/dashboard/authentication>`_ page. The public key
will be added to the ``~/.ssh/authorized_keys`` file on your Uberspace. You can use ``RSA`` or ``ECDSA`` keys.


Using a config file
===================

Especially when using connections to multiple (Uberspace) servers you will benefit from managing these in a SSH config file. On your local system
create a file ``~/.ssh/config`` and give it the right permissions for SSH to read:

.. code-block:: console

  localuser@localhost ~ $ touch ~/.ssh/config
  localuser@localhost ~ $ chmod 600 ~/.ssh/config
  localuser@localhost ~ $

(How you need to do this will of course depend on your operating system.)

You may add an example basic config like this to the file:

.. code-block:: cfg

  Host uberspace.isabell
    Hostname stardust.uberspace.de
    User isabell

From then on you will be able to login by simply using:

.. code-block:: console

  localuser@localhost ~ $ ssh uberspace.isabell

You are totally free in chosing a name (-schema) for ``Host``, you may also use the asterisk ``*`` for multiple connection types and there are a lot more of
configuration possibilities. The `internet <https://www.ssh.com/academy/ssh/config#format-of-ssh-client-config-file-ssh_config>`_ will serve you with more information about it.


Troubleshooting
===============

When your connection does not work, SSH will usually not return a proper error message by default. You can switch to the debug mode with the ``-v`` or even more
verbose with the ``-vvv`` flag:

.. code-block:: console

  localuser@localhost ~ $ ssh isabell@stardust.uberspace.de -vvv
  […]

The output won't be very easy to read but you can identify if the correct keys and configurations you set have been used.