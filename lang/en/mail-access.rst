####################
Accessing Your Mails
####################

IMAP / POP3 / SMTP Ports
------------------------

To accecss your mails with a mail client, use these ports and settings:

========  ========  ===
Protocol  STARTTLS  TLS
========  ========  ===
IMAP      143       993
POP3      110       995
SMTP      587       ⛔


Unencrypted connections without either STARTTLS or TLS are not accepted.

Apple Mail
----------

If Apple Mail on macOS or iOS complains that the Account or the SMTP server is offline, this is usually caused by the *Automatically manage connection settings* option. If this option is active, Apple Mail will sometimes replace the correct settings with incorrect ones, blocking access to the account. If this happens, open *Preferences - Accounts - <select an account> - Server Settings* and disable the setting. Then replace the incorrect port with the correct SMTP port (587) and enable *Use TLS/SSL*.

Debugging
---------

The most common problems when using a mail client with an Uberspace account:

* Incorrect SMTP port: The standard port for sending mail is 587, but many clients try to use ports 25 and 465. This won't work on Uberspace.
* Some home routers, especially some *Speedport* models offered by Deutsche Telekom, block SMTP connections to servers that are not on an internal white list. You need to either disable this feature or add your Uberspace host to the white list.
* Similarly, some anti-virus applications block SMTP connections or modify the port. 
* Some mail clients won't allow mail passwords that are longer than 16 characters.