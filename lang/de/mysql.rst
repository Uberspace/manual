#####
MySQL
#####

Wir stellen MariaDB 10.1 als MySQL-kompatiblen Datenbankserver bereit.
Wenn du bereits mit MySQL vertraut bist, kannst du dich beruhigt zurücklehnen:
Um Verwirrung vorzubeugen, verwendet MariaDB die gleichen Kommandobezeichnungen, die du schon kennst, also ``mysql``, ``mysqldump`` etc. - benutze sie einfach wie gewohnt.

Unser Standardsetup stellt dir eine Datenbank und einen User bereit, die genauso heißen wie dein Uberspace, aber du kannst später auch noch weitere Datenbanken anlegen.


Zugangsdaten
============

Applikationen, die auf MySQL als Datenbank basieren, werden dich nach einem Benutzernamen, einem Passwort, einem Datenbanknamen und ggf. einem Host/Port fragen.

+--------------+---------------------------------------------+
| Benutzername | *entspricht deinem Uberspace-Benutzernamen* |
+--------------+---------------------------------------------+
| Passwort     | *siehe unten*                               |
+--------------+---------------------------------------------+
| Datenbank    | *entspricht deinem Uberspace-Benutzernamen* |
+--------------+---------------------------------------------+
| Host/Port    | localhost                                   |
+--------------+---------------------------------------------+

Dein MySQL-Passwort unterscheidet sich von allen anderen Passwörtern.
Wir haben dir ein starkes generiert und es in der Datei ``~/.my.cnf`` abgelegt, die von den Kommandozeilen-Tools von MariaDB benutzt wird, um dich automatisch einzuloggen.
Wirf daher einen Blick in diese Datei oder führe ``my_print_defaults client`` aus, um es anzuzeigen, was dann so aussieht:

.. code-block:: shell

  [eliza@dolittle ~]$ my_print_defaults client
  --user=eliza
  --password=SomeStrongPassword


Passwort ändern
---------------

Du kannst dein Passwort mit dem SQL-Befehl `SET PASSWORD <https://mariadb.com/kb/en/mariadb/set-password/>`_ ändern.
Tools wie Adminer or phpMyAdmin stellen dir eine webbasierte Möglichkeit dafür bereit (falls du jene installiert hast), aber du kannst dein Passwort auch leicht auf der Shell ändern:

.. code-block:: shell

  [eliza@dolittle ~]$ mysql -e "SET PASSWORD = PASSWORD('YourNewPassword')"

Du wirst im Normalfall keine Ausgabe zu sehen bekommen; MariaDB beschwert sich nur, wenn etwas schiefging.

Wenngleich dieser Schritt nicht zwingend nötig ist, so empfehlen wir dir dennoch, das neue Passwort mit einem Texteditor deiner Wahl in der ``~/.my.cnf`` zu hinterlegen.
Auf diese Weise bleiben die Kommandozeilen-Tools von MariaDB dazu in der Lage, dich automatisch einzuloggen.


Benutzer ohne Schreibrechte
---------------------------

Während die meisten Applikationen, die auf MySQL als Datenbank basieren, genau einen Datenbank-Benutzer unterstützen (und erwarten, dass jener Schreibrechte hat),
gibt es auch Anwendungsfälle, bei denen ein Benutzer sinnvoll sein kann, der ausschließlich Leserechte hat, insbesondere unter dem Gesichtspunkt der Sicherheit.
Wir stellen dir daher einen zusätzlichen Benutzer mit der Endung ``_ro`` ("read-only") bereit, den du in diesen Fällen benutzen kannst.
Dieser Benutzer hat ein anderes Passwort als der Standardbenutzer; du findest es ebenfalls in der Datei ``~/.my.cnf`` oder
kannst es dir mit ``my_print_defaults clientreadonly`` anzeigen lassen, was dann so aussieht:

.. code-block:: shell

  [eliza@dolittle ~]$ my_print_defaults clientreadonly
  --user=eliza_ro
  --password=SomeOtherStrongPassword

Leider kannst du das Passwort des Benutzers ohne Schreibrechte nicht selbst ändern (er hat ja eben keine Schreibrechte).
Wenn du es wirklich ändern musst, wende dich bitte an hallo@uberspace.de.


Zusätzliche Datenbanken
=======================

Zusätzlich zur Standard-Datenbank, die so heißt wie dein Uberspace, kannst du dir eine unbegrenzte Zahl zusätzlicher Datenbanken anlegen,
solange deren Name mit deinem Benutzernamen und ``_`` beginnt - wenn dein Benutzername ``eliza`` ist, kannst du dir also
Datenbanken mit namen wie ``eliza_blog`` oder ``eliza_shop`` anlegen.

Neue Datenbanken kannst du mit dem SQL-Befehl `CREATE DATABASE <https://mariadb.com/kb/en/mariadb/create-database/>`_ anlegen.
Tools wie Adminer or phpMyAdmin stellen dir eine webbasierte Möglichkeit dafür bereit (falls du jene installiert hast), aber du kannst eine Datenbank auch leicht auf der Shell anlegen:

.. code-block:: shell

  [eliza@dolittle ~]$ mysql -e "CREATE DATABASE eliza_blog"

Du wirst im Normalfall keine Ausgabe zu sehen bekommen; MariaDB beschwert sich nur, wenn etwas schiefging.

Um eine Datenbank zu löschen, kannst du den SQL-Befehl `DROP DATABASE <https://mariadb.com/kb/en/mariadb/drop-database/>`_ verwenden:

.. code-block:: shell

  [eliza@dolittle ~]$ mysql -e "DROP DATABASE eliza_blog"

Du wirst im Normalfall keine Ausgabe zu sehen bekommen; MariaDB beschwert sich nur, wenn etwas schiefging.


Mit Dumps arbeiten
==================

Dumps sind der Standardweg, um Datenbanken zu exportieren und zu importieren.
Du kannst sie als Backup benutzen oder auch um eine bestehende Datenbank von einem anderen Host auf deinen Uberspace zu migrieren oder umgekehrt.


Dumps erstellen
---------------

Der Befehl ``mysqldump`` ermöglicht dir, Tabellen oder auch komplette Datenbanken zu exportieren. Der Dump besteht dabei aus einem Bündel von SQL-Befehlen, die bei Ausführung die Tabellenstruktur anlegen und die Datensätze hinzufügen.
Der häufigste Anwendungsfall ist, die Ausgabe des Befehls in eine Datei umzuleiten, beispielsweise so:

.. code-block:: shell

  [eliza@dolittle ~]$ mysqldump eliza > eliza.sql

Dieser Befehl exportiert alle Tabellen der Datenbank ``eliza`` auf einmal. Wenn nur eine oder einige Tabellen exportieren willst, gib ihre Namen hinter dem Datenbanknamen an:

.. code-block:: shell

  [eliza@dolittle ~]$ mysqldump eliza table1 > eliza.table1.sql
  [eliza@dolittle ~]$ mysqldump eliza table2 table3 > eliza.table2and3.sql

Da die resultierenden Dateien reine Textdateien sind (wie gesagt, es sind nur Bündel von SQL-Befehlen), kannst du sie auch leicht komprimieren, zum Beispiel mit ``xz``:

.. code-block:: shell

  [eliza@dolittle ~]$ mysqldump eliza | xz > eliza.sql.xz


Dumps importieren
-----------------

Da Dumps ja letztlich reine Textdateien mit SQL-Befehlen sind, kannst du sie einfach an den Befehl ``mysql`` übergeben, um die in eine Datenbank deiner Wahl zu importieren.
Um beispielsweise einen Dump namens ``eliza.sql`` in die Datenbank ``eliza`` zu importieren (wobei bereits bestehende Tabellen überschrieben werden), kannst du ausführen:

.. code-block:: shell

  [eliza@dolittle ~]$ mysql eliza < eliza.sql

Im Fall eines komprimierten Dumps kannst du ``xzcat`` benutzen, um ihn zu entpacken, bevor du ihn an MariaDB übergibst:

.. code-block:: shell

  [eliza@dolittle ~]$ xzcat eliza.sql.xz | mysql eliza


Dumps übertragen
----------------

Wenn du eine Datenbank in eine andere Datenbank kopieren willst oder von einem anderen MySQL- oder MariaDB-Host auf deinen Uberspace übertragen willst, musst du gar nicht erst den Zwischenschritt über eine Datei gehen.
Wenn du bereits eine Datenbank ``eliza_copy`` angelegt hast, kannst du wie folgt alle Daten aus ``eliza`` dorthin kopieren:

.. code-block:: shell

  [eliza@dolittle ~]$ mysqldump eliza | mysql eliza_copy

Das funktioniert auch über SSH - wenn du beispielsweise eine Datenbank auf einem anderen Host hast, zu dem du ebenfalls Shellzugang per SSH hast, kannst du so vorgehen, um alle Tabellen der Datenbank ``otherdatabase`` in die Datenbank ``eliza`` zu importieren (wobei bereits bestehende Tabellen überschrieben werden):

.. code-block:: shell

  [eliza@dolittle ~]$ ssh otheruser@some.other.host mysqldump otherdatabase | mysql eliza


Zugriff von außen
=================

Aus Sicherheitsgründen erlauben wir keine direkten Verbindungen zu deiner Datenbank über das Internet.
Du kannst dich aber "quasi direkt" von einem anderen Rechner aus mit deiner Datenbank verbinden, in dem du einen SSH-Tunnel benutzt.


.. _mysql-ssh-tunnel-using-linux:

Linux, macOS oder jedes andere Unix
-----------------------------------

Linux, macOS und praktisch jedes andere Unix-Betriebssystem liefert `OpenSSH <https://www.openssh.com/>`_
vorinstalliert mit, so dass du es ohne Klimmzüge benutzen kannst.

So baust du eine SSH-Verbindung auf, die einen Tunnel auf Port 3306 bereitstellt, wobei
dein lokaler Rechner durch das Prompt ``[localuser@localhost ~]$`` repräsentiert wird:

.. code-block:: console

  [localuser@localhost ~]$ ssh -L 3306:127.0.0.1:3306 eliza@dolittle.uberspace.de

Von da an kannst du dich von deinem lokalen Rechner aus mit 127.0.0.1:3306 verbinden, um deine Datenbank anzusprechen.
Faktisch ist es OpenSSH, das da auf Port 3306 lauscht und die MySQL-Verbindung zu deinem Uberspace tunnelt.


Windows
-------

Keine aktuelle Windows-Version liefert von Haus aus einen SSH-Client mit, aber es gibt viele Optionen,
wobei `PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_ wahrscheinlich die Wahl der meisten Windows-Anwender darstellen dürfte.
Andere verbreitete Alternativen umfassen `Git BASH <https://git-for-windows.github.io/>`_, was eine bash als Shell bereitstellt und dazu
das verbreitete Versionskontrollsystem Git und OpenSSH als SSH-Client beinhaltet.
Wenn du eher nach einer großen Zusammenstellung von GNU- und Open-Source-Tools suchst, die sich mehr oder weniger wie eine Linux-Distribution anfühlt,
schau mal bei `Cygwin <https://www.cygwin.com/>`_ vorbei.
Wenn du dich für eins der beiden letztgenannten entscheidest, solltest du nach der Installation lieber dem Abschnitt
:ref:`mysql-ssh-tunnel-using-linux` folgen, weil du dann faktisch die Kommandozeilentools von OpenSSH benutzt.

Wenn du PuTTY benutzen möchtest, um einen SSH-Tunnel aufzubauen, kannst du so vorgehen:

#. Starte PuTTY. Dir wird automatisch der Dialog zur Konfiguration angezeigt.
#. Wechsele im Menübaum links zu "Connection | Data". Gib deinen Usernamen (ìm Beispiel ``eliza``)
   in der Textbox "Auto-login username" ein.
#. Wechsele im Menübaum links zu "Connection | SSH | Tunnels".
   Gib im Feld "Source port:" den Wert "3306" ein, im Feld "Destination:" den Wert "127.0.0.1:3306", und wähle "(o) Local" aus.
   Klicke auf "Add", um den Tunnel hinzuzufügen.
#. Wechsele im Menübaum link zu "Session". Gib im Feld "Host Name (or IP address)" deinen Hostnamen (im Beispiel ``dolittle.uberspace.de``) ein.
   Die so getätigten Einstellungen solltest du nun als Session-Profil speichern.
   Gib dazu in der Textbox "Saved Sessions" eine Beschreibung ein (z.B. "eliza auf dolitte mit MySQL" oder etwas wie "Mein privater Uberspace mit MySQL").
   Klicke dann auf den "Save"-Button.

Wenn du dich nun mit deiner Datenbank verbinden möchtest, starte die Verbindung, in dem du das Session-Profil doppelt anklickst; der SSH-Tunnel wird dabei automatisch aufgebaut.

Von da an kannst du dich von deinem lokalen Rechner aus mit 127.0.0.1:3306 verbinden, um deine Datenbank anzusprechen.
Faktisch ist es PuTTY, das da auf Port 3306 lauscht und die MySQL-Verbindung zu deinem Uberspace tunnelt.
