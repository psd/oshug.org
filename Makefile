CONFIG=\
	config/site.yaml

BAKE=bin/bake.pl

SCRIPTS=\
	$(BAKE)

# no dependencies, always runs ..
all::	site site/styles/prefix.ttf site/styles/prefix.eot
	$(BAKE)

site:
	mkdir site

site/styles/prefix.ttf:
	ln fonts/prefix.ttf site/styles/prefix.ttf

site/styles/prefix.eot:
	ln fonts/prefix.eot site/styles/prefix.eot

deploy:	all
	cd site && rsync -avz -e ssh .htaccess * ${OSHUG_HOST}:${OSHUG_DIR}
