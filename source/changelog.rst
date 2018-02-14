.. _changelog:

#########
Changelog
#########

This document will track major changes in the project.

{# add/edit files in source/changelog to generate new changelog entries #}
{% for entry in changelog_entries %}

----

.. _v{{ entry.version }}:

[{{ entry.version }}] - {{ entry.date }}
=========

{{ entry.text }}
{% endfor %}
