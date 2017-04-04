DATE = `date +'%Y%m%d'`
GVERSION = '9.1'
VERSION = '9.1'
dummy:
	echo "test"

lair:
	cd valair && make deb-pkg; make windows

msi:
	cd lair-msi && make windows && git add . && git commit -am "new msi package" && git push origin master

lair-art:
	cd lairart && make deb-pkg; make windows; git add . && git commit -am "new msi package images" && git push origin master

web:
	echo "True"
	cp lair_$(GVERSION)-1_amd64.buildinfo lair_$(GVERSION)-1_amd64.changes lair_$(GVERSION)-1_amd64.deb lair_$(GVERSION)-1_amd64.deb.md lair_$(GVERSION)-1.debian.tar.xz lair_$(GVERSION)-1.dsc lair_$(GVERSION).orig.tar.gz lair-dbgsym_$(GVERSION)-1_amd64.deb lair-dbgsym_$(GVERSION)-1_amd64.deb.md sdl2-vapi_2.0-1_amd64.deb tartrazine_0.9-1_amd64.deb tox-vapi_0.9-1_amd64.deb lair-deb/packages
	cp lairart_$(VERSION)-1_amd64.buildinfo lairart_$(VERSION)-1_amd64.changes lairart_$(VERSION)-1_amd64.deb lairart_$(VERSION)-1.debian.tar.xz lairart_$(VERSION)-1.dsc lairart_$(VERSION).orig.tar.gz lair-dbgsym_$(VERSION)-1_amd64.deb sdl2-vapi_2.0-1_amd64.deb lair-deb/packages
	cd lair-deb && apt-now
	cd lair-web && make && git add . && git commit -am "new webpage" && git push origin master
