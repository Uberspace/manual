# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = _build

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  dirhtml    to make HTML files named index.html in directories"
	@echo "  singlehtml to make a single large HTML file"
	@echo "  pickle     to make pickle files"
	@echo "  json       to make JSON files"
	@echo "  htmlhelp   to make HTML files and a HTML help project"
	@echo "  qthelp     to make HTML files and a qthelp project"
	@echo "  applehelp  to make an Apple Help Book"
	@echo "  devhelp    to make HTML files and a Devhelp project"
	@echo "  epub       to make an epub"
	@echo "  epub3      to make an epub3"
	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
	@echo "  latexpdfja to make LaTeX files and run them through platex/dvipdfmx"
	@echo "  text       to make text files"
	@echo "  man        to make manual pages"
	@echo "  texinfo    to make Texinfo files"
	@echo "  info       to make Texinfo files and run them through makeinfo"
	@echo "  gettext    to make PO message catalogs"
	@echo "  changes    to make an overview of all changed/added/deprecated items"
	@echo "  xml        to make Docutils-native XML files"
	@echo "  pseudoxml  to make pseudoxml-XML files for display purposes"
	@echo "  linkcheck  to check all external links for integrity"
	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"
	@echo "  coverage   to run coverage check of the documentation (if enabled)"
	@echo "  serve      to automatically build the source, when something changes. Also runs a webserver for your viewing pleasure"
	@echo "  dummy      to check syntax errors of document sources"

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)/*

.PHONY: html
html:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/html/en
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/html/de
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

.PHONY: dirhtml
dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/dirhtml/en
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/dirhtml/de
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

.PHONY: singlehtml
singlehtml:
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/singlehtml/en
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/singlehtml/de
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

.PHONY: pickle
pickle:
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/pickle/en
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/pickle/de
	@echo
	@echo "Build finished; now you can process the pickle files."

.PHONY: json
json:
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/json/en
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/json/de
	@echo
	@echo "Build finished; now you can process the JSON files."

.PHONY: htmlhelp
htmlhelp:
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/htmlhelp/en
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/htmlhelp/de
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in $(BUILDDIR)/htmlhelp."

.PHONY: qthelp
qthelp:
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/qthelp/en
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/qthelp/de
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/uberspace.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/uberspace.qhc"

.PHONY: applehelp
applehelp:
	$(SPHINXBUILD) -b applehelp $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/applehelp/en
	$(SPHINXBUILD) -b applehelp $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/applehelp/de
	@echo
	@echo "Build finished. The help book is in $(BUILDDIR)/applehelp."
	@echo "N.B. You won't be able to view it unless you put it in" \
	      "~/Library/Documentation/Help or install it in your application" \
	      "bundle."

.PHONY: devhelp
devhelp:
	$(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/devhelp/en
	$(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/devhelp/de
	@echo
	@echo "Build finished."
	@echo "To view the help file:"
	@echo "# mkdir -p $$HOME/.local/share/devhelp/uberspace"
	@echo "# ln -s $(BUILDDIR)/devhelp $$HOME/.local/share/devhelp/uberspace"
	@echo "# devhelp"

.PHONY: epub
epub:
	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/epub/en
	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/epub/de
	@echo
	@echo "Build finished. The epub file is in $(BUILDDIR)/epub."

.PHONY: epub3
epub3:
	$(SPHINXBUILD) -b epub3 $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/epub3/en
	$(SPHINXBUILD) -b epub3 $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/epub3/de
	@echo
	@echo "Build finished. The epub3 file is in $(BUILDDIR)/epub3."

.PHONY: latex
latex:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/latex/en
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/latex/de
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make' in that directory to run these through (pdf)latex" \
	      "(use \`make latexpdf' here to do that automatically)."

.PHONY: latexpdf
latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/latex/en
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/latex/de
	@echo "Running LaTeX files through pdflatex..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

.PHONY: latexpdfja
latexpdfja:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/latex/en
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/latex/de
	@echo "Running LaTeX files through platex and dvipdfmx..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf-ja
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

.PHONY: text
text:
	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/text/en
	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/text/de
	@echo
	@echo "Build finished. The text files are in $(BUILDDIR)/text."

.PHONY: man
man:
	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/man/en
	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/man/de
	@echo
	@echo "Build finished. The manual pages are in $(BUILDDIR)/man."

.PHONY: texinfo
texinfo:
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/texinfo/en
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/texinfo/de
	@echo
	@echo "Build finished. The Texinfo files are in $(BUILDDIR)/texinfo."
	@echo "Run \`make' in that directory to run these through makeinfo" \
	      "(use \`make info' here to do that automatically)."

.PHONY: info
info:
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/texinfo/en
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/texinfo/de
	@echo "Running Texinfo files through makeinfo..."
	make -C $(BUILDDIR)/texinfo info
	@echo "makeinfo finished; the Info files are in $(BUILDDIR)/texinfo."

.PHONY: gettext
gettext:
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS) lang/en $(BUILDDIR)/locale/en
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS) lang/de $(BUILDDIR)/locale/de
	@echo
	@echo "Build finished. The message catalogs are in $(BUILDDIR)/locale."

.PHONY: changes
changes:
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/changes/en
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/changes/de
	@echo
	@echo "The overview file is in $(BUILDDIR)/changes."

.PHONY: linkcheck
linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/linkcheck/en
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/linkcheck/de
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

.PHONY: doctest
doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/doctest/en
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/doctest/de
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

.PHONY: coverage
coverage:
	$(SPHINXBUILD) -b coverage $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/coverage/en
	$(SPHINXBUILD) -b coverage $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/coverage/de
	@echo "Testing of coverage in the sources finished, look at the " \
	      "results in $(BUILDDIR)/coverage/python.txt."

.PHONY: xml
xml:
	$(SPHINXBUILD) -b xml $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/xml/en
	$(SPHINXBUILD) -b xml $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/xml/de
	@echo
	@echo "Build finished. The XML files are in $(BUILDDIR)/xml."

.PHONY: pseudoxml
pseudoxml:
	$(SPHINXBUILD) -b pseudoxml $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/pseudoxml/en
	$(SPHINXBUILD) -b pseudoxml $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/pseudoxml/de
	@echo
	@echo "Build finished. The pseudo-XML files are in $(BUILDDIR)/pseudoxml."

.PHONY: serve
serve:
	sphinx-autobuild -p 9001 -b html $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/html/en
	sphinx-autobuild -p 9001 -b html $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/html/de

.PHONY: dummy
dummy:
	$(SPHINXBUILD) -b dummy $(ALLSPHINXOPTS) lang/en $(BUILDDIR)/dummy/en
	$(SPHINXBUILD) -b dummy $(ALLSPHINXOPTS) lang/de $(BUILDDIR)/dummy/de
	@echo
	@echo "Build finished. Dummy builder generates no files."
