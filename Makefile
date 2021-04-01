#
# Makefile
# Martin Užák, 2020-05-10 06:49
#

.PHONY: serve publish etym wiki clean

ETYM_DIR	?= ~/repos/etymolog
ETYM_UI_DIR ?= ~/repos/etymolog-ui
DEST		?= ~/repos/uzak.github.io

serve:
	bundle exec jekyll serve 

blog:
	bundle exec jekyll build -d $(DEST)

etym:
	# db
	(cd $(ETYM_DIR) && make db.json)
	# ui
	DEPLOY_DIR=$(DEST)/etymolog make -C $(ETYM_UI_DIR) build 

wiki:
	rm -rfv $(DEST)/wiki
	mkdir -v $(DEST)/wiki
	$(foreach i,1 2 3 4, vim -n +"call vimwiki#base#goto_index($(i))" +VimwikiAll2HTML +q;)

sask: sask.md
	pandoc sask.md \
		--toc \
		-o $(DEST)/assets/sask.pdf \
		-M date="`LC_ALL=sk_SK.utf8 date "+%d. %B %Y"`"

publish: 
	cd $(DEST) && \
	git add . && \
	git commit -m "$(MAKECMDGOALS)" && \
	git push

clean:
	rm -rfv _site

all: clean serve

# vim:ft=make
