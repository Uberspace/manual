#########
Changelog
#########

Below you can see the 5 most recent changes to Uberspace 7. For older changes,
please refer to the :doc:`Changelog Archive <changelog_archive>`.

.. include:: includes/hotfix-version.rst

{# add/edit files in source/changelog to generate new changelog entries #}
{% for entry in changelog_entries[:5] %}

----

.. _v{{ entry.version }}_short:

{{ entry.title }}
{% for n in range(entry.title|length) %}*{% endfor %}

{{ entry.text }}
{% endfor %}
