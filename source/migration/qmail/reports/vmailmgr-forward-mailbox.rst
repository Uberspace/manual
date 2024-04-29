.. _vmailmgr-forward-mailbox:

There are mailusers with direct forward to a mailbox
====================================================

``id:vmailmgr-forward-mailbox``

We can only support full mailaddresses as forwards in the standard mail system. This error indicates, that you have
set up internal mail forwards to a mailuser.

You can find a more detailed list of mailusers with the following command:

.. code-block:: console

 [isabell@stardust ~]$ listvdomain
 info No post
 post Yes

All lines with 3 or more columns contain forwards which should be full mailaddresses. If not you should replace those
using the `uberspace mail commands <https://manual.uberspace.de/mail-forwarding/>`_.

.. include:: ../includes/levels/warning.rst