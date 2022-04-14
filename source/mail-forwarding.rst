################
Forwarding mails
################

You can create a simple forward or alias for arbitrary mailusers like

* ``forwardme@username.uber.space`` → ``mail@example.com``
* ``hello@yourdomain.com`` → ``support@yourdomain.com``

.. tip::
    A single forward mailuser will work for **all** mail domains you have setup on your Uberspace.

Configuring forwards
====================

.. note::

    It is possible to use the `Dashboard <https://dashboard.uberspace.de/>`_ for creating mail accounts and forwards, to do so login and use the `mail section <https://dashboard.uberspace.de/dashboard/mail>`_. Here we will explain our prefered way using SSH and the ``uberspace mail`` commands.

Add a forward for a mailuser
----------------------------

You can set up forwards with the ``uberspace mail user forward set <mailuser> <mailaddress>`` command. You may also use this command to create an internal alias, but you always have to specify the full mailaddress.

To forward all mails from ``forwardme`` to ``mail@example.com`` run the following command:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail user forward set forwardme mail@example.com
 Mail to 'forwardme' will be forwarded to 'mail@example.com'.
 [isabell@stardust ~]$

.. tip::
    ``uberspace mail user forward set`` overwrites existing configurations.


Show an existing forward for a mailuser
---------------------------------------

You can show your existing forward using the ``uberspace mail user forward list`` command, e.g. if you have setup a forwarding for ``forwardme``:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail user forward list forwardme
 mail@example.com
 [isabell@stardust ~]$


Delete forward for a mailuser
-----------------------------

You can remove a forwarding using the ``uberspace mail user forward del <mailuser>`` command. This will delete the specified alias,
so mails sent to it will no longer be delivered (except if you set up a `catchall address <https://manual.uberspace.de/mail-mailboxes#catch-all-mailbox>`_).
To delete a forwarding for ``forwardme``, run the following command:

.. code-block:: console

 [isabell@stardust ~]$ uberspace mail user forward del forwardme
 Mail to 'forwardme' will no longer be forwarded.
 [isabell@stardust ~]$


Spam filtering
==============

With enabled :doc:`spam filtering <mail-spam>` we do not forward mails with a spam score greater than ``5``. These mails get sorted into ``~/users/MAILUSER/.Spam``.


Using .qmail files
==================

.. warning::
    In the past, with the outdated product version Uberspace 6 we encouraged users to manipulate ``.qmail`` files for forwarding and controlling the email flow. This is technically still possible on U7 but will strongly interfere with our standard email setup that should be configured by using the ``uberspace mail`` commands.

    Because of this, we no longer can support you in technical issues with qmail programming but recommend you to move your mail setup to the ``uberspace mail`` tools. The qmail configuration is still available and we also use the ``.qmail-default`` file to configure the spamfolder, but this might change in the future and break your custom configurations.
