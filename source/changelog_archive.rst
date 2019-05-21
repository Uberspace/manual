.. _changelogarchive:

#################
Changelog Archive
#################

This document contains all changes made to Uberspace 7.

{# add/edit files in source/changelog to generate new changelog entries #}
{% for entry in changelog_entries %}

----

.. _v{{ entry.version }}:

[{{ entry.version }}] - {{ entry.date }}
*******

{{ entry.text }}
{% endfor %}
