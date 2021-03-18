#
# Makefile
# Martin Užák, 2020-05-10 06:49
#

.PHONY: serve publish

serve:
	bundle exec jekyll serve -H 0.0.0.0

external_artefacts: 
	time ./publish.sh

sask:
	pandoc sask.md -o assets/sask.pdf --toc -M date="`LC_ALL=sk_SK.utf8 date "+%d. %B %Y"`"

clean:
	rm -rfv _site

all: clean sask external_artefacts serve

# vim:ft=make
#
