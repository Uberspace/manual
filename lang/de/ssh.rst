###
SSH
###

Einführung
==========

.. toctree::
   :maxdepth: 2

.. tip:: Wenn du dich bereits mit SSH auskennst, kannst du gern direkt zum Abschnitt :ref:`ssh-advanced-topics` springen.

Bei Uberspace erledigst du die meisten administrativen Aufgaben auf der Shell, einer textbasierten Kommandozeile.
Das mag auf den ersten Blick kompliziert oder auch verwirrend für Leute sein, die eher Webinterfaces gewohnt sind,
aber für viele Entwickler, Webdesigner und fortgeschrittene User ist die Shell der bevorzugte Weg, mit dem Server zu interagieren,
weil du damit mehr oder weniger alles tun kannst, auch Dinge, die auch *wir* nicht im Kopf hatten.

Wenn du zum ersten Mal mit einer Shell zu tun hast - keine Sorge! Der Anfang ist schnell gemacht,
wir helfen dir gern, und wir sind davon überzeugt, dass du dich schnell zurechtfindest und dann nicht mehr zurück willst.

Um dich mit der Shell deines Accounts zu verbinden, ist das "Secure Shell"-Protokoll (SSH) der vorgesehene Weg.
Als weit verbreitetes Protokoll wird es von Programmen auf praktisch allen Betriebssystemen unterstützt, selbst auf Smartphones.


Zugangsdaten
------------

Um dich per SSH mit deinem Uberspace zu verbinden, brauchst du drei Informationen:

#. Einen **Benutzernamen** - das ist der Username, den du dir im Registrierungsprozess selbst ausgesucht hast.
#. Einen **Hostnamen** - das ist der Name des Servers, auf dem dein Account angelegt wurde.
   Diesen Hostnamen findest du im `Datenblatt <https://uberspace.de/dashboard/datasheet>`_.
   Er folgt immer dem Schema ``<irgendwas>.uberspace.de``.
#. Ein **Passwort** oder einen **privaten Schlüssel** - wenn du Einsteiger bist, setze eins im Dashboard unter dem Punkt `Zugänge <https://uberspace.de/dashboard/authentication>`_.
   Du kannst auch jederzeit später noch SSH-Keys hinzufügen, wie im Kapitel :ref:`ssh-working-with-keys` beschrieben.

Im Rahmen dieser Einführung verwenden wir exemplarisch ``eliza`` als Benutzername und ``dolittle.uberspace.de`` als Hostname.

Mit diesen Daten bauen wir nun die erste SSH-Verbindung zu deinem Uberspace auf. Bitte anschnallen!


.. _ssh-using-linux:

Verbindung von Linux, macOS oder jedem anderen Unix aus
-------------------------------------------------------

Unter Linux, macOS und praktisch jedem anderen Unix-Betriebssystem ist `OpenSSH <https://www.openssh.com/>`_
bereits vorinstalliert, so dass du es direkt benutzen kannst. So wird deine erste SSH-Verbindung aussehen,
wobei dein lokaler Rechner durch das Prompt ``[localuser@localhost ~]$`` dargestellt wird:

.. code-block:: console

  [localuser@localhost ~]$ ssh eliza@dolittle.uberspace.de
  The authenticity of host 'dolittle.uberspace.de (ip.ip.ip.ip)' can't be established.
  RSA key fingerprint is fp:fp:fp:fp:fp:fp:fp:fp:fp:fp:fp:fp:fp:fp:fp:fp.
  Are you sure you want to continue connecting (yes/no)? yes
  Warning: Permanently added 'dolittle.uberspace.de,ip.ip.ip.ip' (RSA) to the list of known hosts.
  eliza@dolittle.uberspace.de's password: 
  [eliza@dolittle ~]$

Was du als erstes siehst, ist der sogenannte Fingerprint des Schlüssels des Hosts, mit dem du dich verbinden willst.
Bitte kontrolliere, ob er mit dem Fingerprint im `Datenblatt <https://uberspace.de/dashboard/datasheet>`_ übereinstimmt.
Wenn du einen anderen Fingerprint bekommst, prüfe bitte zunächst, ob du dich vielleicht beim Hostnamen vertippt hast,
was der häufigste Grund dafür ist. Wenn der Hostname stimmt und du immer noch den falschen Fingerprint angezeigt bekommst,
`melde dich bitte bei uns <mailto:hallo@uberspace.de>`_.

Dieser Teil ist wichtig, weil du gleich dein Passwort an diesen Server senden willst, deshalb solltest du sicherstellen,
dass es auch der *richtige* Host ist und du dein Passwort nicht an einen potentiellen Angreifer übermittelst.

Wenn der Fingerprint stimmt, gib bitte `yes` ein und drücke Enter, um weiterzumachen. OpenSSH merkt sich den Fingerprint,
so dass du ihn nur beim ersten Mal prüfen musst.
Es wird lautstark protestieren, wenn sich der Schlüssel des Hosts (und damit sein Fingerprint) einmal ändert,
was während der Lebenszeit eines Hosts nie passieren sollte.
Wenn du jemals so eine Situation beobachten solltest, fahre bitte nicht fort,
sondern `melde dich bitte bei uns <mailto:hallo@uberspace.de>`_.

Als nächstes wirst du nach deinem Passwort gefragt. Während du es eintippst, wird nichts angezeigt; das ist richtig und beabsichtigt so - tippe es einfach blind ein und drücke Enter!

Das Prompt ``[eliza@dolittle ~]$`` zeigt dir nun, dass du erfolgreich verbunden bist. Alle Befehle, die du nun eingibst, werden auf deinem Uberspace ausgeführt und nicht auf deinem lokalen Rechner.

Mit dem Befehl ``exit`` (oder in dem du Strg+D drückst) verlässt du die Shell, womit die SSH-Verbindung geschlossen wird:

.. code-block:: console

  [eliza@dolittle ~]$ exit
  Connection to dolittle.uberspace.de closed.
  [localuser@localhost ~]$

Du befindest dich nun wieder auf deinem lokalen Rechner.


Verbindung von Windows aus
--------------------------

Keine der derzeit verfügbaren Windows-Versionen liefert einen SSH-Client mit, aber du hast eine Reihe von Möglichkeiten,
wobei `PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_ die Wahl der meisten Windows-User darstellen dürfte.
Andere verbreitete Lösungen sind beispielsweise `Git BASH <https://git-for-windows.github.io/>`_, das dir eine grundlegende Shell
sowie Git als Versionskontrollsystem liefert.
Wenn du nach einer umfangreicheren Zusammenstellung von GNU- und Open-Source-Software suchst, die sich mehr oder weniger wie
eine Linux-Distribution anfühlt, schau mal bei `Cygwin <https://www.cygwin.com/>`_ vorbei.
Wenn du dich für eins der letzten beiden Tools entscheidest, solltest du nach der Installation am Besten dem Abschnitt
:ref:`ssh-using-linux` folgen, statt hier weiterzulesen, weil du dann faktisch mit OpenSSH arbeiten wirst.

.. warning:: Einige SFTP-Programme bieten die Möglichkeit, einzelne Befehle per SSH auf einem Server auszuführen,
  beispielsweise FileZilla mit der Funktion ``Server | Enter custom command...``.
  Es gibt zwar Anwendungsfälle, in denen das praktisch ist; allerdings ist diese Funktion wirklich nur für die Ausführung einzelner
  Befehle gedacht; sie liefert dir *nicht* die interaktive Shell, die du brauchst.

In dieser Einführung verwenden wir PuTTY, aber du kannst natürlich auch jeden anderen SSH-Client wählen.


PuTTY herunterladen
~~~~~~~~~~~~~~~~~~~

Bitte lade dir die `Entwicklungsversion des MSI-Installers <https://tartarus.org/~simon/putty-snapshots/x86/putty-installer.msi>`_
herunter, der alle PuTTY-Tools beinhaltet, die wir im Folgenden ansprechen werden (PuTTY selbst, den PuTTYgen-Schlüsselgenerator sowie den Pageant-SSH-Agenten).

Wir empfehlen dir die Entwicklerversion statt der aktuellen stabilen Version wegen ihrer Unterstützung für ED25519-Schlüssel,
die wir gegenüber RSA-Schlüsseln bevorzugen.
Wenn du lieber die `aktuelle stabile Version <https://the.earth.li/~sgtatham/putty/latest/x86/putty-0.67-installer.msi>`_ verwenden möchtest,
solltest du später bei der Schlüsselgenerierung RSA-Schlüssel mit einer Schlüsselgröße von 4096 Bit verwenden, die für die nächsten Jahre
noch als ziemlich sicher gelten dürften.

Der Installationsprozess der PuTTY-Toolsammlung sollte nichts Ungewöhnliches beinhalten; akzeptiere einfach alle vorgeschlagenen Standardeinstellungen.


Anlegen eines Session-Profils
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bitte starte nun PuTTY. Es öffnet sich automatisch ein Dialog zur Konfiguration.

Wechsele links im Menü zum Abschnitt "Connection | Data" und gib deinen Benutzernamen (in unserem Beispiel wäre das ``eliza``)
im Feld "Auto-login username" ein.

Wechsele nun links im Menü zum Abschnitt "Session" und gibt dort deinen Hostnamen (in unserem Beispiel wäre das ``dolittle.uberspace.de``)
im Feld "Host Name (or IP address)" ein.

Des Komforts wegen solltest du nun diese Einstellungen als Session-Profil speichern.
Gib dazu eine entsprechende Beschreibung (sowas wie "eliza auf dolittle" oder "Mein persönlicher Uberspace") im Feld "Saved Sessions" ein.
Klicke dann den "Save"-Button an.
Von nun an kannst du nach dem Start von PuTTY einfach auf dieses Session-Profil doppelklicken und PuTTY wird eine Verbindung zu deinem Uberspace aufbauen.


Erste Verbindung
~~~~~~~~~~~~~~~~

Was PuTTY dir als erstes anzeigt, ist der sogenannte Fingerprint des Schlüssels des Hosts, mit dem du dich verbinden willst.
Bitte kontrolliere, ob er mit dem Fingerprint im `Datenblatt <https://uberspace.de/dashboard/datasheet>`_ übereinstimmt.
Wenn du einen anderen Fingerprint bekommst, prüfe bitte zunächst, ob du dich vielleicht beim Hostnamen vertippt hast,
was der häufigste Grund dafür ist. Wenn der Hostname stimmt und du immer noch den falschen Fingerprint angezeigt bekommst,
`melde dich bitte bei uns <mailto:hallo@uberspace.de>`_.

Dieser Teil ist wichtig, weil du gleich dein Passwort an diesen Server senden willst, deshalb solltest du sicherstellen,
dass es auch der *richtige* Host ist und du dein Passwort nicht an einen potentiellen Angreifer übermittelst.

Wenn der Fingerprint stimmt, klicke bitte auf `Yes`. PuTTY merkt sich den Fingerprint,
so dass du ihn nur beim ersten Mal prüfen musst.
Es wird lautstark protestieren, wenn sich der Schlüssel des Hosts (und damit sein Fingerprint) einmal ändert,
was während der Lebenszeit eines Hosts nie passieren sollte.
Wenn du jemals so eine Situation beobachten solltest, fahre bitte nicht fort,
sondern `melde dich bitte bei uns <mailto:hallo@uberspace.de>`_.

Als nächstes wirst du nach deinem Passwort gefragt. Während du es eintippst, wird nichts angezeigt; das ist richtig und beabsichtigt so - tippe es einfach blind ein und drücke Enter!

So sollte das innerhalb des Terminal-Fensters von PuTTY aussehen:

.. code-block:: console

  Using username "eliza".
  Using keyboard-interactive authentication.
  Password:
  [eliza@dolittle ~]$

Das Prompt ``[eliza@dolittle ~]$`` zeigt dir nun, dass du erfolgreich verbunden bist. Alle Befehle, die du nun eingibst, werden auf deinem Uberspace ausgeführt und nicht auf deinem lokalen Rechner.


Mit dem Befehl ``exit`` (oder in dem du Strg+D drückst) verlässt du die Shell, womit die SSH-Verbindung geschlossen wird.



.. _ssh-advanced-topics:

Weiterführende Themen
=====================


.. _ssh-working-with-keys:

Mit Schlüsseln arbeiten
-----------------------

Sich mit einem SSH-Schlüssel anstelle eines Passworts einzuloggen, ist der bevorzugte Weg, sich gegenüber deinem Uberspace zu authentifizieren.
Dazu generierst du für jeden SSH-Client, der sich mit deinem Uberspace verbinden soll, ein Schlüsselpaar (bestehend aus einem öffentlichen
Schlüssel, den du auf deinem Uberspace hinterlegst, und einem passwortgeschützten privaten Schlüssel, der niemals das Gerät verlassen sollte,
auf dem er generiert wurde, außer vielleicht zwecks eines Backups).
Es gilt als gute Praxis, für jeden SSH-Client ein eigenes Schlüsselpaar zu generieren; du kannst beliebig viele SSH-Schlüssel auf deinem Uberspace hinterlegen.
Die Verwendung mehrerer Schlüssel erleichtert es, einzelne davon wieder zu entfernen, falls du beispielsweise eins deiner Geräte verloren hast.

Schlüsselnutzung mit OpenSSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Erstelle eine Schlüsselpaar auf deinem lokalen Rechner - du kannst alle Standardvorgaben übernehmen, wenn du noch kein Schlüsselpaar hast.
Wenn du nach einer Passphrase gefragt wirst, um den privaten Schlüssel zu verschlüsseln, musst du jene blind eingeben; das ist richtig und beabsichtigt.
Du musst sie zweimal eingeben, um sicherzugehen, dass du dich nicht vertippst.

.. code-block:: console

  [localuser@localhost ~]$ ssh-keygen -t ed25519 -a 100
  Generating public/private ed25519 key pair.
  Enter file in which to save the key (/home/localuser/.ssh/id_ed25519):
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in /home/localuser/.ssh/id_ed25519.
  Your public key has been saved in /home/localuser/.ssh/id_ed25519.pub.
  The key fingerprint is:
  SHA256:fpfpfpfpfpfpfpfpfpfpfpfpfpfpfpfpfpfpfpfpfpf localuser@localhost
  The key's randomart image is:
  +--[ED25519 256]--+
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  | . . . . . . . . |
  +----[SHA256]-----+

.. warning: Technisch gesehen kannst du die Passphrase auch weglassen und deinen privaten Schlüssel unverschlüsselt lassen.
  Wir raten allerdings dringend davon ab, das zu tun - ansonsten kann jeder, der Zugriff auf deinen privaten Schlüssel bekommt
  (beispielsweise weil dir dein Laptop gestohlen wird) sich automatisch auch auf deinem Uberspace einloggen.
  Bitte verwende lieber eine *gute* Passphrase, was in erster Linie deutet: Eine *lange*, die du auch sonst nirgendwo nutzt.

Als nächstes musst du den Inhalt der Datei ``id_ed25519.pub`` (nicht den Inhalt der Datei ``id_ed25519`` - die enthält deinen *privaten* Schlüssel) in der Datei ``~/.ssh/authorized_keys`` auf deinem Uberspace hinterlegen.
Dazu kannst du den Befehl ``ssh-copy-id`` verwenden oder im Dashboard den Menüpunkt `Zugänge <https://uberspace.de/dashboard/authentication>`_ benutzen, der ziemlich selbsterklärend sein sollte.
Hier ein Beispiel, wie es aussieht, wenn du ``ssh-copy-id`` verwendest - wenn du nach einem Passwort gefragt wirst, ist damit *nicht* die Passphrase deines privaten Schlüssels gemeint
(die brauchst du nur dann, wenn du dich mit Hilfe des Schlüssels verbindest), sondern das SSH-Passwort deines Uberspaces.

.. code-block:: console

  [localuser@localhost ~]$ ssh-copy-id -i id_ed25519.pub eliza@dolittle.uberspace.de
  /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "id_ed25519.pub"
  /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
  /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
  Password:
  
  Number of key(s) added: 1
  
  Now try logging into the machine, with:   "ssh 'eliza@dolittle.uberspace.de'"
  and check to make sure that only the key(s) you wanted were added.

Von nun an musst du beim Aufbau einer SSH-Verbindung die Passphrase deines privaten Schlüssels angeben, auf dem der zugehörige öffentliche Schlüssel hinterlegt ist. Aber:
Die meisten Linux-Distributionen haben allerdings bereits ``ssh-agent`` für dich eingerichtet. Dabei handelt es sich um ein Programm,
das mit dem Einloggen an deinem lokalen Rechner automatisch gestartet wurde und im Hintergrund läuft. Es merkt sich dabei den entschlüsselten privaten Schlüssel
im Arbeitsspeicher (nicht auf der Festplatte), solange du an deinem lokalen Rechner eingeloggt bist.
Das heißt, dass du bis zu einem Reboot deines lokalen Rechners deinen privaten Schlüssel nur *einmal* entsperren musst,
egal an wievielen Hosts du dich damit dann einloggst.
Füge dazu deinen privaten Schlüssel zum Schlüsselbund des Agents hinzu:

.. code-block:: console

  [localuser@localhost ~]$ ssh-add ~/.ssh/id_ed25519
  Enter passphrase for ~/.ssh/id_ed25519:
  Identity added: ~/.ssh/id_ed25519 (localuser@localhost)

Das war's! Wenn ``ssh-agent`` unerwarteterweise *nicht* auf deinem lokalen Rechner vorkonfiguriert sein sollte,
konsultiere bitte das Handbuch deines Betriebssystems, um zu erfahren, wie du vorgehen musst
(das unterscheidet sich von Betriebssystem zu Betriebssystem ein wenig).

Schlüsselnutzung mit PuTTY/PuTTYgen/Pageant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PuTTY selbst ist lediglich ein SSH-Client, aber der Autor stellt auch das Tool PuTTYgen bereit, um Schlüsselpaare zu generieren.

Schlüsselpaar generieren
........................

Bitte starte PuTTYgen. Du siehst nun einen Dialog zur Erstellung eines Schlüsselpaars.

Bitte wählen "ED25519" als Schlüsseltyp aus.

In dem du auf den "Generate"-Button klickst, startest du den Prozess der Erstellung des Schlüsselpaar.
Du wirst dabei ein wenig deine Maus über dem vorgesehenen leeren Feld bewegen müssen, um Zufallsdaten zu generieren.
Wenn du fertig bist, wird dir im Feld "Public key for pasting into OpenSSH authorized_keys file" ein Haufen Zeichen angezeigt.
Bitte wähle den gesamten Inhalt dieses Felds aus und kopiere ihn mit Strg+C in die Zwischenablage.

Bitte gib dann eine Passphrase sowohl ins Feld "Key passphrase:" als auch ins Feld "Confirm passphrase:" ein.

.. warning: Technisch gesehen kannst du die Passphrase auch weglassen und deinen privaten Schlüssel unverschlüsselt lassen.
  Wir raten allerdings dringend davon ab, das zu tun - ansonsten kann jeder, der Zugriff auf deinen privaten Schlüssel bekommt
  (beispielsweise weil dir dein Laptop gestohlen wird) sich automatisch auch auf deinem Uberspace einloggen.
  Bitte verwende lieber eine *gute* Passphrase, was in erster Linie deutet: Eine *lange*, die du auch sonst nirgendwo nutzt.

Speichere nun sowohl den öffentlichen als den privaten Schlüssel mit den zugehörigen Buttons ab.
Die Dateinamen kannst du dir selbst aussuchen, aber um der gängigen Konvention zu folgen,
solltest du dem öffentlichen Schlüssel die Endung ``.pub`` und dem privaten Schlüssel die
Endung ``.ppk`` geben.

Öffentlichen Schlüssel hinterlegen
..................................

RUfe nun im Dashboard das Menü `Zugänge <https://uberspace.de/dashboard/authentication>`_ auf und füge bei den SSH-Schlüsseln den Inhalt deiner Zwischenablage ein.
Das Dashboard wird diesen öffentlichen Schlüssel dann in der Dateí ``~/.ssh/authorized_keys`` auf deinem Uberspace eintragen.

Mit PuTTYgen bist du an dieser Stelle fertig und du kannst es schließen. Wechseln wir nun zu PuTTY!

Verbindung mit privatem Schlüssel herstellen
............................................

Wenn du bereits ein Session-Profil gespeichert hast, lade es (nur laden, baue noch keine Verbindung auf).

Wechsele links im Menü zum Abschnitt "Connection | SSH | Auth". 
Beim Feld "Private key file for authentication:" klicke auf "Browse..." und wähle dort deinen privaten Schlüssel aus (die Datei mit der Endung ``.ppk``).

Wechsele dann links im Menü zurück zum Abschnitt "Session" und speichere die geänderte Session.

Von nun an wird dich PuTTY nicht mehr nach deinem *Passwort* fragen (dem Passwort, das du für deinen Uberspace gesetzt hast),
sondern nach deiner *Passphrase* (der Passphrase, die du bei der Erstellung des Schlüsselpaars in PuTTYgen verwendet hast).
Das ist zwar sicherer als der Login per Passwort, aber noch nicht komfortabler. Dafür kommt nun Pageant ins Spiel!

Passphrase mit Pageant merken
.............................

Um zu vermeiden, dass du bei jedem Verbindungsaufbau die Passphrase deines privaten Schlüssels eingeben musst,
kannst du den Pageant-SSH-Agenten verwenden, der vom gleichen Autor wie PuTTY selbst stammt.
Pageant merkt sich deinen entschlüsselten privaten Schlüssel im Arbeitsspeicher (nicht auf der Festplatte),
so dass du die Passphrase nur einmal eingeben musst, bis du deinen lokalen Rechner einmal rebootest.

Bitte starte Pageant. Im System-Tray wird ein kleines Icon erscheinen, das einen Computer mit einem Hut zeigt.

Doppelklicke auf dieses Icon, um die Liste von privaten Schlüsseln zu öffnen, die Pageant kennt (am Anfang wird diese Liste noch leer sein).

Klicke nun auf "Add Key" und wähle die Datei mit deinem privaten Schlüssel aus (also die mit der Endung ``.ppk``).
Du musst nun die Passphrase dieses Schlüssels eingeben, um ihn zu entschlüsseln.

Das war's! Von nun an brauchst du kein Passwort und keine Passphrase mehr einzugeben, wenn du dich mit PuTTY mit Hilfe deines privaten
Schlüssels irgendwo einzuloggen versuchst, da Pageant diesen Schlüssel automatisch liefert.


Verbindungs-Multiplexing verwenden
----------------------------------

Wenn du SSH verwendest, ist der *Aufbau* der Verbindung das, was am meisten Ressourcen benötigt, weil dabei die komplizierten Teile der Verschlüsselung abgewickelt werden.
Wenn du insofern *viele* SSH-Verbindungen zum gleichen Uberspace aufbauen willst (egal ob gleichzeitig oder nacheinander),
so solltest du in jedem Fall Verbindungs-Multiplexing (OpenSSH) bzw. COnnection Sharing (PuTTY) verwenden.
Verbreitete Anwendungsfälle dafür sind zum Beispiel Integrierte Entwicklungsumgebungen (IDE), die sich per SSH mit Git-Repositories verbinden,
oder auch Tools für Konfigurationsmanagement wie zum Beispiel Ansible, die sich per SSH mit dem Zielsystem verbinden.

Wenn du Verbindungs-Multiplexing bzw. Connection Sharing verwendest, findet der komplizierte Teil der Verschlüsselung nur beim allerersten Verbindungsaufbau statt.
Jede weitere Verbindung wird sich dann einfach an die bestehende und bereits authentifizierte SSH-Verbindung andocken.
Dabei wird ein weiterer Kanal geöffnet, der sich so anfühlt wie eine eigenständige Verbindung,
obwohl er in Wirklichkeit die bereits bestehende weiterverwendet.

Verbindungs-Multiplexing mit OpenSSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bitte trage so einen Abschnitt in deine lokale Datei `~/.ssh/config` ein (im Beispiel konzentrieren wir uns auf ``Host *.uberspace.de``, aber du kannst die Einstellung auch auf ``Host *`` anwenden):

.. code-block:: none

  Host *.uberspace.de
    ControlMaster auto
    ControlPersist yes
    ControlPath ~/.ssh/socket-%r@%h:%p

Wenn du dich als ``eliza`` mit ``dolittle.uberspace.de`` verbinden willst, wird OpenSSH zunächst prüfen, ob es bereits
einen lokalen Socket namens ``~/.ssh/socket-eliza@dolittle.uberspace.de:22`` gibt und sich ggf. an jenen andocken.
Wenn es noch keinen gibt, wird es sich wie gewohnt verbinden und diesen Socket *bereitstellen*, damit weitere Verbindungen ihn nutzen können.

Connection Sharing mit PuTTY
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wechsele links im Menü zum Abschnitt "Connections | SSH" und aktiviere dort die Checkbox "Share SSH connections if possible".

Wenn du mit Session-Profilen arbeitest, kannst du außerdem eine Session deiner Wahl laden (nicht doppelklicken, sondern nur einmal, und dann mit "Load" laden),
dort dann dann Connection Sharing einschalten und anschließend die Session wieder speichern.

Wenn du eine frische Verbindung zu einem Host aufbaust, wird PuTTY dich noch wie gewohnt nach deinem Passwort fragen oder dich mit deinem privaten Schlüssel einloggen.
Wenn du dann im Menü des Fensters "Duplicate session" auswählst, bekommst du *sofort* eine weitere Session,
in der auch "Reusing a shared connection to this server" unmittelbar vor dem Prompt angezeigt wird,
um dir zu signalisieren, dass du auf einer bereits bestehenden Verbindung aufsetzt.
