CONFIG=\
	config/site.yaml

BAKE=bin/bake.pl

SCRIPTS=\
	$(BAKE)

# no dependencies, always runs ..
all::	site site/images site/styles site/images/oshug.png site/images/oshug.pdf site/favicon.ico
	$(BAKE)

site:
	mkdir site

site/styles:
	mkdir -p site/styles

site/images:
	mkdir -p site/images

site/images/oshug.png:
	ln images/oshug.png site/images/oshug.png

site/images/oshug.pdf:
	ln images/oshug.pdf site/images/oshug.pdf

site/favicon.ico:
	ln images/favicon.ico site/favicon.ico

deploy:	all
	cd site && rsync -avz -e ssh .htaccess * ${OSHUG_HOST}:${OSHUG_DIR}
