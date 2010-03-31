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
