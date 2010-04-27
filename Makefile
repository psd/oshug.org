CONFIG=\
	config/site.yaml

BAKE=bin/bake.pl

SCRIPTS=\
	$(BAKE)

# no dependencies, always runs ..
all::	site
	$(BAKE)

site:
	mkdir site

deploy:	all
	cd site && rsync -avz -e ssh .htaccess * ${OSHUG_HOST}:${OSHUG_DIR}
