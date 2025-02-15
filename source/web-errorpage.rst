#############
web errorpage
#############

By default, we replace all HTTP 500 responses with an error page telling you and your users what to do in this case. This behavior also helps to keep your site secure, in case the backend application is configured to leak stacktraces or other confidential information on the error page.

To show the original error page as generated by your application or our web server, take a look at the following commands. This may be helpful to gather addition information while debugging. It can also be used to show a prettier error page matching your design.

.. code-block:: console

  [isabell@stardust ~]$ uberspace web errorpage 500 disable
  Error page for HTTP 500 is disabled.

To re-enable our error page again, execute:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web errorpage 500 enable
  Error page for HTTP 500 is enabled.

To check the current configuration, execute:

.. code-block:: console

  [isabell@stardust ~]$ uberspace web errorpage 500 status
  Error page for HTTP 500 is enabled.
