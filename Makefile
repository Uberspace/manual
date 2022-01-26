# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = Uberspace7manual
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile setup setup-venv setup-requirements

setup: setup-venv setup-requirements

setup-venv: version ?= $(cat runtime.txt)
setup-venv:
	python$(version) -m venv .venv
	.venv/bin/pip install --isolated --no-input --quiet --upgrade pip

setup-requirements: req ?= requirements.txt
setup-requirements:
	.venv/bin/pip install --isolated --no-input --quiet -r '$(req)'

serve:
	sphinx-autobuild --ignore '*.atom' -b html $(SOURCEDIR) $(BUILDDIR)/html

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
