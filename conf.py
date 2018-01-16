# general settings
import sphinx_rtd_theme

templates_path = ['_templates']
source_suffix = ['.rst']
master_doc = 'index'
project = 'Uberspace 7 manual'
copyright = '2018, Uberspace.de'
author = 'Uberspace.de'
version = '7'
release = '7.0.24'
language = None
pygments_style = 'sphinx'
todo_include_todos = False

# rtd theme settings
# https://github.com/rtfd/sphinx_rtd_theme
html_theme = 'sphinx_rtd_theme'
html_theme_options = {
  'display_version': False,
  'navigation_depth': 2,
  'collapse_navigation': True
}
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
html_static_path = ['../../_static']
html_last_updated_fmt = '%b %d, %Y'
html_context = {
  'css_files': ['_static/css/custom.css'],
}
html_show_copyright = False
html_favicon = 'favicon.ico'

# settings for versioning
# https://robpol86.github.io/sphinxcontrib-versioning/settings.html#cmdoption-b
scv_show_banner = True
scv_banner_main_ref = 'stable'
scv_banner_recent_tag = True
scv_root_ref = 'stable'
scv_priority = 'branches'
scv_whitelist_branches = ('stable','master')

# breadcrumps settings, see _templates/breadcrumbs.html
html_display_gitlab = True
html_gitlab_host = 'git.uber.space'
html_gitlab_user = 'uberspace'
html_gitlab_repo = 'manual'
html_gitlab_version = 'master'
