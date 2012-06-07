CONFIG=\
	config/site.yaml

BAKE=bin/bake.pl

SCRIPTS=\
	$(BAKE)

# no dependencies, always runs ..
all::	site site/images site/styles site/images/oshug.png site/images/oshug.pdf site/images/DS_with_RS.jpg site/images/skpang_logo.gif site/images/Embecosm.jpg site/images/sup_ site/favicon.ico
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

site/images/DS_with_RS.jpg:
	ln images/DS_with_RS.jpg site/images/DS_with_RS.jpg

site/images/skpang_logo.gif:
	ln images/skpang_logo.gif site/images/skpang_logo.gif

site/images/Embecosm.jpg:
	ln images/Embecosm.jpg site/images/Embecosm.jpg

site/images/sup_:
	ln images/sup_bbcld.jpg site/images/sup_bbcld.jpg
	ln images/sup_c4cc.jpg site/images/sup_c4cc.jpg
	ln images/sup_designspark.jpg site/images/sup_designspark.jpg
	ln images/sup_londonhackspace.jpg site/images/sup_londonhackspace.jpg
	ln images/sup_memset.gif site/images/sup_memset.gif
	ln images/sup_oomlout.jpg site/images/sup_oomlout.jpg
	ln images/sup_osmosoft.png site/images/sup_osmosoft.png
	ln images/sup_skillsmatter.gif site/images/sup_skillsmatter.gif
	ln images/sup_skpang.gif site/images/sup_skpang.gif
	ln images/sup_universityofkent.jpg site/images/sup_universityofkent.jpg
	ln images/sup_embecosm.jpg site/images/sup_embecosm.jpg

site/favicon.ico:
	ln images/favicon.ico site/favicon.ico

deploy:	all
	cd site && rsync -avz -e ssh .htaccess * ${OSHUG_HOST}:${OSHUG_DIR}
