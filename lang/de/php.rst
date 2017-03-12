
###
PHP
###

Wir stellen PHP in unterschiedlichen Versionen bereit, die mit dem Kommandozeilen-Tool :code:`uberspace-select-version` ausgewählt werden können.

Jeder neu erstellte Uberspace account hat :ref:`standard_php_version` voreingestellt.

**************
Version wählen
**************

Die PHP-Version kann mittels :code:`uberspace-select-version php <version>` gewählt werden. Hierbei kannst du zwischen major- und minor-Versionen wählen, bestimmte patch-Versionen sind nicht wählbar.

PHP 7
=====

.. _standard_php_version:

aktuellstets PHP 7
------------------

Um immer auf dem neuesten Stand zu bleiben und immer die aktuellste minor-Version zu nutzen (also z.B. PHP 7.1, PHP 7.2, PHP 7.3, ...), reicht der folgende Befehl aus:

  .. code-block:: console

    $ uberspace-select-version php 7
    Selected PHP version 7
    The new configuration is adapted immediately. Minor updates will be applied automatically.

In diesem Fall brauchst du dir weder Gedanken um Minor-, noch um Patch-Updates machen. Die werden von uns automatisch verteilt und du bist immer vorne mit dabei.

PHP 7.0
-------

Wenn du PHP 7.0 nutzen willst, gehe folgendermaßen vor:

  .. code-block:: console

    $ uberspace-select-version php 7.0
    Selected PHP version 7.0
    The new configuration is adapted immediately. Patch updates will be applied automatically.

Auch hier kümmern wir uns um die Patch-Updates.

PHP 5
=====

Wenn du noch auf PHP 5 angewiesen bist, ist das auch kein Problem.

aktuellstets PHP 5
------------------

  .. code-block:: console

    $ uberspace-select-version php 5
    Selected PHP version 5
    The new configuration is adapted immediately. Minor updates will be applied automatically.

Minor-, noch um Patch-Updates kommen automatisch von uns ohne dein Zutun.

PHP 5.6
-------

Für PHP 5.6 führe den folgenden Befehl aus:

  .. code-block:: console

    $ uberspace-select-version php 5.6
    Selected PHP version 5.6
    The new configuration is adapted immediately. Patch updates will be applied automatically.

Wir kümmern uns um die Patch-Updates.
