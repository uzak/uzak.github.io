#
# Makefile
# Martin Užák, 2020-05-10 06:49
#

.PHONY: serve publish etym wiki

ETYM_DIR	?= ~/repos/etymolog
ETYM_UI_DIR ?= ~/repos/etymolog-ui
DEST		?= ~/repos/uzak.github.io

serve:
	bundle exec jekyll serve # -H 0.0.0.0

blog:
	bundle exec jekyll build -d $(DEST)

etym:
	# db
	(cd $(ETYM_DIR) && make db.json)
	# ui
	DEPLOY_DIR=$(DEST) make -C $(ETYM_UI_DIR) build 

wiki:
	rm -rfv $(DEST)/wiki
	mkdir -v $(DEST)/wiki
	$(foreach i,1 2 3 4, vim -n +"call vimwiki#base#goto_index($(i))" +VimwikiAll2HTML +q;)

publish: #blog etym wiki
	cd $(DEST) && \
	git add . && \
	git commit -m "Update: $(shell date '+%c')" && \
	git push
	
sask: sask.md
	pandoc sask.md -o assets/sask.pdf --toc -M date="`LC_ALL=sk_SK.utf8 date "+%d. %B %Y"`"

clean:
	rm -rfv _site

all: serve

# vim:ft=make
#
