CONFIG=\
	config/site.yaml

BAKE=bin/bake.pl

SCRIPTS=\
	$(BAKE)

# no dependencies, always runs ..
all::	site site/images site/styles site/styles/prefix.ttf site/styles/prefix.eot site/images/oshug.png
	$(BAKE)

site:
	mkdir site

site/styles:
	mkdir -p site/styles

site/images:
	mkdir -p site/images

site/styles/prefix.ttf:
	ln fonts/prefix.ttf site/styles/prefix.ttf

site/styles/prefix.eot:
	ln fonts/prefix.eot site/styles/prefix.eot

site/images/oshug.png:
	ln images/oshug.png site/images/oshug.png

deploy:	all
	cd site && rsync -avz -e ssh .htaccess * ${OSHUG_HOST}:${OSHUG_DIR}
