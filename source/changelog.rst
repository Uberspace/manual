.. _changelog:

#########
Changelog
#########

Below you can see the 5 most recent changes to Uberspace 7. For older changes,
please refer to the :ref:`Changelog Archive <changelogarchive>`.

{# add/edit files in source/changelog to generate new changelog entries #}
{% for entry in changelog_entries[:5] %}

----

.. _v{{ entry.version }}:

[{{ entry.version }}] - {{ entry.date }}
*******

{{ entry.text }}
{% endfor %}
