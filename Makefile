CONFIG=\
	config/site.yaml

BAKE=bin/bake.pl

SCRIPTS=\
	$(BAKE)

# no dependencies, always runs ..
all::	site site/images site/styles site/images/oshug.png site/images/oshug.pdf site/images/DS_with_RS.jpg site/images/skpang_logo.gif site/images/Embecosm.jpg site/images/ESPKTN.jpg site/images/Quick2Wire.png site/images/Solderpad.png site/images/ABOpen.png site/images/XMOS.png site/images/Codethink.png site/images/sup_bbcld.jpg site/images/sup_c4cc.jpg site/images/sup_designspark.jpg site/images/sup_londonhackspace.jpg site/images/sup_memset.gif site/images/sup_oomlout.jpg site/images/sup_osmosoft.png site/images/sup_skillsmatter.gif site/images/sup_skpang.gif site/images/sup_universityofkent.jpg site/images/sup_embecosm.jpg site/images/sup_cosm.jpg site/images/sup_capitalscf.jpg site/images/sup_espktn.jpg site/images/sup_erlangsolutions.png site/images/sup_quick2wire.png site/images/sup_solderpad.png site/images/sup_surevoip.png site/images/sup_solderpad.png site/images/sup_abopen.png site/images/sup_xmos.png site/images/sup_codethink.png site/favicon.ico
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

site/images/ESPKTN.jpg:
	ln images/ESPKTN.jpg site/images/ESPKTN.jpg

site/images/Quick2Wire.png:
	ln images/Quick2Wire.png site/images/Quick2Wire.png

site/images/Solderpad.png:
	ln images/Solderpad.png site/images/Solderpad.png

site/images/ABOpen.png:
	ln images/ABOpen.png site/images/ABOpen.png

site/images/XMOS.png:
	ln images/XMOS.png site/images/XMOS.png

site/images/Codethink.png:
	ln images/Codethink.png site/images/Codethink.png

site/images/sup_bbcld.jpg:
	ln images/sup_bbcld.jpg site/images/sup_bbcld.jpg

site/images/sup_c4cc.jpg:
	ln images/sup_c4cc.jpg site/images/sup_c4cc.jpg

site/images/sup_designspark.jpg:
	ln images/sup_designspark.jpg site/images/sup_designspark.jpg

site/images/sup_londonhackspace.jpg:
	ln images/sup_londonhackspace.jpg site/images/sup_londonhackspace.jpg

site/images/sup_memset.gif:
	ln images/sup_memset.gif site/images/sup_memset.gif

site/images/sup_oomlout.jpg:
	ln images/sup_oomlout.jpg site/images/sup_oomlout.jpg

site/images/sup_osmosoft.png:
	ln images/sup_osmosoft.png site/images/sup_osmosoft.png

site/images/sup_skillsmatter.gif:
	ln images/sup_skillsmatter.gif site/images/sup_skillsmatter.gif

site/images/sup_skpang.gif:
	ln images/sup_skpang.gif site/images/sup_skpang.gif

site/images/sup_universityofkent.jpg:
	ln images/sup_universityofkent.jpg site/images/sup_universityofkent.jpg

site/images/sup_embecosm.jpg:
	ln images/sup_embecosm.jpg site/images/sup_embecosm.jpg

site/images/sup_cosm.jpg:
	ln images/sup_cosm.jpg site/images/sup_cosm.jpg

site/images/sup_capitalscf.jpg:
	ln images/sup_capitalscf.jpg site/images/sup_capitalscf.jpg

site/images/sup_espktn.jpg:
	ln images/sup_espktn.jpg site/images/sup_espktn.jpg

site/images/sup_erlangsolutions.png:
	ln images/sup_erlangsolutions.png site/images/sup_erlangsolutions.png

site/images/sup_quick2wire.png:
	ln images/sup_quick2wire.png site/images/sup_quick2wire.png

site/images/sup_solderpad.png:
	ln images/sup_solderpad.png site/images/sup_solderpad.png

site/images/sup_surevoip.png:
	ln images/sup_surevoip.png site/images/sup_surevoip.png

site/images/sup_abopen.png:
	ln images/sup_abopen.png site/images/sup_abopen.png

site/images/sup_xmos.png:
	ln images/sup_xmos.png site/images/sup_xmos.png

site/images/sup_codethink.png:
	ln images/sup_codethink.png  site/images/sup_codethink.png

site/favicon.ico:
	ln images/favicon.ico site/favicon.ico

deploy:	all
	cd site && rsync -avz -e ssh .htaccess * ${OSHUG_HOST}:${OSHUG_DIR}
