.. _mailfilters:

###############
Filtering mails
###############

DNS blacklists
==============

We try to minimize incoming SPAM mails by filtering with two blacklists: The `DNSBL (DNS-based blacklist) of NiX Spam <http://www.dnsbl.manitu.net>`_ and the `SpamCop Blocking List <https://www.spamcop.net/bl.shtml>`_. These blacklists have existed for a long time, are queried by almost every mail provider, and are generally considered legitimate.

Privacy
-------

With DNS blacklists we don't look into the mail itself, neither header nor content. If the delivering mailserver is on a blacklist we just don't accept the mail at all and bounce it.
