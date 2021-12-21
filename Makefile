#
# Makefile
# Martin Užák, 2020-05-10 06:49
#

.PHONY: serve etym wiki clean

ETYM_DIR		?= ~/repos/etymolog
ETYM_UI_DIR 	?= ~/repos/etymolog-ui
DEST			?= ~/repos/uzak.github.io
DEST_MODS		?= ~/repos/blog

serve:
	bundle exec jekyll serve 

blog:
	bundle exec jekyll build -d $(DEST)

etym:
	# db
	(cd $(ETYM_DIR) && make db.json)
	# ui
	DEPLOY_DIR=$(DEST_MODS)/etymolog make -C $(ETYM_UI_DIR) build 
	# also put to $(DEST)
	rm -rf $(DEST)/etymolog
	cp -rv $(DEST_MODS)/etymolog $(DEST)/etymolog

wiki:
	rm -rfv $(DEST_MODS)/wiki
	mkdir -v $(DEST_MODS)/wiki
	$(foreach i,1 2 3 4 5, vim -n +"call vimwiki#base#goto_index($(i))" +VimwikiAll2HTML +q;)
	# also put to $(DEST)
	rm -rf $(DEST)/wiki
	cp -rv $(DEST_MODS)/wiki $(DEST)/wiki

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
