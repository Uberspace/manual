###############
Qmail Migration
###############

On the upcoming Uberspace U8 mail system the deprecated qmail configurations from U6 will no longer be available.

Check your configuration
------------------------

To check now if any of your qmail configurations encounter problems to be used in the standard mail setup, you
can use the migration tool:

.. code-block:: console

 [isabell@stardust ~]$ uberspace migration qmail status
 Error: there are 2 problems with your mail config.

 To see more details info run the check command with "uberspace migration qmail check".

The command will help you to identify any problems in your current configuration. You can see more details with
the subcommand ``check``:

.. code-block:: console

 [isabell@stardust ~]$ uberspace migration qmail check
 [...]
 .qmail-postmaster
   error: The file contains a username that is not the current user
 [...]

Add the ``--assist`` flag to see a short info how to fix the problem and a link to the manual with more detailed
information and instructions:

.. code-block:: console

 [isabell@stardust ~]$ uberspace migration qmail check --assist
 [...]
 .qmail-postmaster
   error: The file contains a username that is not the current user
   • Remove the qmail file and use "uberspace mail user forward set postmaster mail@example.com"
   • Manual: https://manual.uberspace.de/migration/qmail/reports/content-username-off
 [...]

Use ``--help`` to see even more options how to use the command.

Error messages
~~~~~~~~~~~~~~

The check command can show you several messages considering your qmail setup. In this list you can find all
error messages and more detailed help pages:

- `The filename ".qmail-Example" cannot be parsed </migration/qmail/reports/config-filename-off.html>`_
- `The file is a subaddressing catchall with a "-" delimiter </migration/qmail/reports/config-is-catchall.html>`_
- `The sysmail config file for username@uber.space contains a vdeliver code pipe </migration/qmail/reports/config-is-sysmail-and-content-vdeliver.html>`_
- `The file contains a code pipe "|" to a custom command </migration/qmail/reports/content-code.html>`_
- `The file conflicts with an already existing mail user </migration/qmail/reports/content-comment-only-and-vmailmgr-user-exists.html>`_
- `The file content is empty </migration/qmail/reports/content-empty.html>`_
- `The file conflicts with an already existing mail user </migration/qmail/reports/content-exit100-and-vmailmgr-user-exists.html>`_
- `The file contains an "|exit 100" code </migration/qmail/reports/content-exit100.html>`_
- `The file contains an internal redirect to a mailuser </migration/qmail/reports/content-linuxuser-mailuser.html>`_
- `The file contains multiple lines which are no mailaddresses </migration/qmail/reports/content-multiline-contains-multiple-non-mailaddr.html>`_
- `Retrieving the file content returned a system error </migration/qmail/reports/content-oserror.html>`_
- `The file contains a path to a custom mailbox-file </migration/qmail/reports/content-path-file.html>`_
- `The file contains a path to the maildir of a non existing mail user </migration/qmail/reports/content-path-folder-fits-and-vmailmgr-user-not-exists.html>`_
- `The maildir path does not point to "~/users/example" </migration/qmail/reports/content-path-folder-off.html>`_
- `The file forwards to a non existing mail user "example" and there is no catchall configured </migration/qmail/reports/content-spamfolder-and-vmailmgr-user-and-catchall-not-exists.html>`_
- `The file contains unknown content </migration/qmail/reports/content-unknown.html>`_
- `The file contains a username that is not the current user </migration/qmail/reports/content-username-off.html>`_
- `The file forwards to a non existing mail user "example" and there is no catchall configured </migration/qmail/reports/content-vdeliver-and-vmailmgr-user-and-catchall-not-exists.html>`_
- `The content of the main qmail file "~/.qmail-default" is a mailaddress </migration/qmail/reports/qmail-default-content-mailaddr.html>`_
- `The content of the main qmail file "~/.qmail-default" is configured with unknown content </migration/qmail/reports/qmail-default-content-unknown.html>`_
- `The content of the main qmail file "~/.qmail-default" is the username </migration/qmail/reports/qmail-default-content-username.html>`_
- `The main qmail file "~/.qmail-default" does not exist </migration/qmail/reports/qmail-default-not-exists.html>`_
- `The file conflicts with an already existing mail user </migration/qmail/reports/qmail-mailaddr-and-vmailmgr-user-blocking.html>`_
- `The file conflicts with an already existing mail user </migration/qmail/reports/qmail-username-and-vmailmgr-user-blocking.html>`_
- `The script file "~/.spamfolder" for the standard mail setup contains unkown content </migration/qmail/reports/spamfolder-file-content-off.html>`_
- `There are mailusers with direct forward to a mailbox </migration/qmail/reports/vmailmgr-forward-mailbox.html>`_
- `The mail database file "~/passwd.cdb" seems to be broken </migration/qmail/reports/vmailmgr-passwd-broken.html>`_
