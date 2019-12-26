SASS=sassc
SASSFLAGS=-M -t compact
ROOT_DIR=${PWD}
DIST_DIR=dist/Cahuella/gtk-3.0
CSS_SRC=src/gtk-contained-dark.scss
ASSETS=./render-assets.sh
INSTALL_DIR=$(DESTDIR)/usr/share/themes/Cahuella

all: clean css

prepare: 
	mkdir -p $(DIST_DIR)

assets: prepare
	$(ASSETS)
	cp -r src/assets $(DIST_DIR)

css: prepare assets
	$(SASS) $(SASSFLAGS) src/gtk-contained-dark.scss $(DIST_DIR)/gtk.css

clean:
	rm -rf $(DIST_DIR)
	rm -rf $(ROOT_DIR)/dist
	rm -f src/assets/*.png

install: all
	cp -r $(DIST_DIR) $(INSTALL_DIR)

uninstall:
	rm -rf $(INSTALL_DIR)

.PHONY: all
.PHONY: prepare
.PHONY: css
.PHONY: clean
.PHONY: install
.PHONY: uninstall

.DEFAULT_GOAL := all

# vim: set ts=4 sw=4 tw=0 noet :
