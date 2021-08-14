.. _mailforwarding:

################
forwarding mails
################

configure forwarding
====================

You can use forwardings in the form of ``$MAILBOX@$USER.uber.space``. If you have :ref:`set up additional domains <mail-domains>`, ``$MAILBOX@$DOMAIN`` will also work.

.. warning::
    We do not forward mails with a :doc:`spam score >= 10 <mail-spam>`. This is crucial due to policy reasons at nearly any mail provider and makes sure the reputation of our servers stays fine.

Add forwards for a mailbox
--------------------------

You can configure forwardings with the ``uberspace mail user forward set <mailbox> <mail address>`` command. This will effectively create an alias for the specified address. There is no way to convert a regular mailbox (without forwarding) to an alias.

To forward all mails from ``forwardme`` to ``mail@allcolorsarebeautiful.example`` run the following command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user forward set forwardme mail@allcolorsarebeautiful.example
 Mail to forwardme will be forwarded to mail@allcolorsarebeautiful.example.
 [isabell@stardust ~]$

.. tip::
    ``uberspace mail user forward set`` overwrites existing configurations.

List existing forwards for a mailbox
------------------------------------

You can list your existing forwardings using the ``uberspace mail user forward list`` command, e.g. if you have setup fowardings for ``forwardme``:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user forward list forwardme
 mail@allcolorsarebeautiful.example
 [isabell@stardust ~]$

Delete forwards for a mailbox
-----------------------------

You can delete forwardings using the ``uberspace mail user forward del <mailbox>`` command. This will delete the specified alias, so mails sent to it will no longer be delivered (except if you set up a `catchall address <https://manual.uberspace.de/mail-mailboxes#catch-all-mailbox>`_). To delete forwarding for ``forwardme``, run the following command:

.. code-block:: bash

 [isabell@stardust ~]$ uberspace mail user forward del forwardme
 Mail to forwardme will no longer be forwarded.
 [isabell@stardust ~]$

spam filtering
==============

With enabled :doc:`spam filtering <mail-spam>` we do not forward mails with a spam score greater than 5. These mails get sorted into ``~/users/$MAILBOX/.Spam``.

.. warning::
    In the past, with the outdated product version Uberspace 6 we encouraged users to manipulate ``.qmail`` files for forwarding and controlling the email flow. This is technically still possible on U7 but will strongly interfere with our standard email setup that should be configured by using the ``uberspace mail`` commands. 
    
    Because of this, we no longer can support you in technical issues with qmail programming but recommend you to move your mail setup to the ``uberspace mail`` tools. The qmail configuration is still available and we also use the ``.qmail-default`` file to configure the spamfolder, but this might change in the future and break your custom configurations.
