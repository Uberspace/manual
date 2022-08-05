Afterwards, ask ``supervisord`` to look for the new ``my-daemon.ini`` file:

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl reread
 my-daemon: available

And then start your daemon:

.. code-block:: bash

 [isabell@stardust ~]$ supervisorctl update
 my-daemon: added process group