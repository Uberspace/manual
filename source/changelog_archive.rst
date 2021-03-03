.. _changelogarchive:

#################
Changelog Archive
#################

This document contains all changes made to Uberspace 7.

.. include:: includes/hotfix-version.rst

{# add/edit files in source/changelog to generate new changelog entries #}
{% for entry in changelog_entries %}

----

.. _v{{ entry.version }}:

{{ entry.title }}
{% for n in range(entry.title|length) %}*{% endfor %}

{{ entry.text }}
{% endfor %}
