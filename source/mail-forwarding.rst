.. _mailforwarding:

################
forwarding mails
################

You can use forwardings in the form of ``$MAILBOX@$USER.uber.space``. If you have :ref:`set up additional domains <mail-domains>`, ``$MAILBOX@$DOMAIN`` will also work.

Add forwards for a mailbox
--------------------------

You can configure forwardings with the ``uberspace mail user forward <mailbox> <mail address>`` command. You can specify as many mail address as you like, mails will get forwarded to all given addresses.

To forward all mails from ``forwardme`` to ``mail@allcolorsarebeautiful.example`` run the following command:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user forward set forwardme mail@allcolorsarebeautiful.example
 Mail to forwardme will be forwarded to mail@allcolorsarebeautiful.example.
 [isabell@philae ~]$

.. tip::
    ``uberspace mail user forward set`` overwrites existing configurations.

List existing forwards for a mailbox
------------------------------------

You can list your existing forwardings using the ``uberspace mail user forward list`` command, e.g. if you have setup fowardings for `forwardme`:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user forward list forwardme
 mail@allcolorsarebeautiful.example
 [isabell@philae ~]$

Delete forwards for a mailbox
-----------------------------

You can delete forwardings using the ``uberspace mail user forward del`` command. To delete forwarding for ``forwardme``, run the following command:

.. code-block:: bash

 [isabell@philae ~]$ uberspace mail user forward del forwardme
 Mail to forwardme will no longer be forwarded.
 [isabell@philae ~]$
