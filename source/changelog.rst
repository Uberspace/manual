.. _changelog:

######################
Changes in Uberspace 7
######################

This document will track major changes in the project.

{# add/edit files in source/changelog to generate new changelog entries #}
{% for entry in changelog_entries %}

----

[{{ entry.version }}] - {{ entry.date }}
=========

{% if loop.first %}
.. _lastchange:
{% endif %}

{{ entry.text }}

{% if loop.first %}
.. _oldentries:
{% endif %}
{% endfor %}
