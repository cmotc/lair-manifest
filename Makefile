include config.mk
DATE = `date +'%Y%m%d'`

COMMIT_MESSAGE = $(GH_NAME)
COMMIT_MESSAGE += $(DEV_MESSAGE)
COMMIT_MESSAGE += `date +'%y%m%d%H%M%S'`

dummy:
	echo "test"

symlink:
	./.fix_lua.sh

clone:
	\git clone git@github.com:$(GH_NAME)/valair || \git clone https://github.com/$(GH_NAME)/valair || git clone https://github.com/cmotc/valair; \
	\git clone git@github.com:$(GH_NAME)/digitalandy || \git clone https://github.com/$(GH_NAME)/digitalandy || git clone https://github.com/cmotc/digitalandy; \
	\git clone git@github.com:$(GH_NAME)/sdl2-vapi || \git clone https://github.com/$(GH_NAME)/sdl2-vapi || git clone https://github.com/cmotc/sdl2-vapi; \
	\git clone git@github.com:$(GH_NAME)/tox-vapi || \git clone https://github.com/$(GH_NAME)/tox-vapi || git clone https://github.com/cmotc/tox-vapi; \
	\git clone git@github.com:$(GH_NAME)/tartrazine || \git clone https://github.com/$(GH_NAME)/tartrazine || git clone https://github.com/cmotc/tartrazine; \
	\git clone git@github.com:$(GH_NAME)/lairart || \git clone https://github.com/$(GH_NAME)/lairart || git clone https://github.com/cmotc/lairart; \
	\git clone git@github.com:$(GH_NAME)/lair-deb || \git clone https://github.com/$(GH_NAME)/lair-deb || git clone https://github.com/cmotc/lair-deb; \
	\git clone git@github.com:$(GH_NAME)/lair-msi || \git clone https://github.com/$(GH_NAME)/lair-msi || git clone https://github.com/cmotc/lair-msi; \
	\git clone git@github.com:$(GH_NAME)/lair-web || \git clone https://github.com/$(GH_NAME)/lair-web || git clone https://github.com/cmotc/lair-web; \
	echo "Cloned subprojects"

deinit:
	 \git remote remove github
	cd valair && \git remote remove github
	cd digitalandy && \git remote remove github
	cd sdl2-vapi && \git remote remove github
	cd tox-vapi && \git remote remove github
	cd tartrazine && \git remote remove github
	cd lairart && \git remote remove github
	cd lair-deb && \git remote remove github
	cd lair-msi && \git remote remove github
	cd lair-web && \git remote remove github
	echo "removed pre-init"

init:
	make init-upstream; \
	\git remote add github git@github.com:$(GH_NAME)/lair-manifest
	cd valair && \git remote add github git@github.com:$(GH_NAME)/valair
	cd digitalandy && \git remote add github git@github.com:$(GH_NAME)/digitalandy
	cd sdl2-vapi && \git  remote add github git@github.com:$(GH_NAME)/sdl2-vapi
	cd tox-vapi && \git  remote add github git@github.com:$(GH_NAME)/tox-vapi
	cd tartrazine && \git  remote add github git@github.com:$(GH_NAME)/tartrazine
	cd lairart && \git  remote add github git@github.com:$(GH_NAME)/lairart
	cd lair-deb && \git  remote add github git@github.com:$(GH_NAME)/lair-deb
	cd lair-msi && \git  remote add github git@github.com:$(GH_NAME)/lair-msi
	cd lair-web && \git  remote add github git@github.com:$(GH_NAME)/lair-web
	echo "Initialized Working Remotes"
	make checkout

init-upstream:
	\git remote add upstream git@github.com:cmotc/lair-manifest; \
	cd valair && \git remote add upstream git@github.com:cmotc/valair
	cd digitalandy && \git remote add upstream git@github.com:cmotc/digitalandy
	cd sdl2-vapi && \git  remote add upstream git@github.com:cmotc/sdl2-vapi
	cd tox-vapi && \git  remote add upstream git@github.com:cmotc/tox-vapi
	cd tartrazine && \git  remote add upstream git@github.com:cmotc/tartrazine
	cd lairart && \git  remote add upstream git@github.com:cmotc/lairart
	cd lair-deb && \git  remote add upstream git@github.com:cmotc/lair-deb
	cd lair-msi && \git  remote add upstream git@github.com:cmotc/lair-msi
	cd lair-web && \git  remote add upstream git@github.com:cmotc/lair-web
	echo "Initialized Upstream Remotes"

checkout:
	\git checkout master
	cd valair && \git  checkout mobs
	cd digitalandy && \git  checkout master
	cd sdl2-vapi && \git  checkout master
	cd tox-vapi && \git  checkout master
	cd tartrazine && \git  checkout master
	cd lairart && \git  checkout gh-pages
	cd lair-deb && \git  checkout gh-pages
	cd lair-msi && \git  checkout master
	cd lair-web && \git  checkout master

commit:
	cd valair && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../digitalandy && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../sdl2-vapi && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../tox-vapi && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../tartrazine && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../lairart && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../lair-deb && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../lair-msi && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../lair-web && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd .. && \git add . && \git commit -am "${COMMIT_MESSAGE}m"; \
	echo "Committed Release:"
	echo "${COMMIT_MESSAGE}"

fetch:
	git fetch upstream &&\git rebase upstream/master; \
	cd valair && git fetch upstream &&\git rebase upstream/mobs; \
	cd ../digitalandy && git fetch upstream &&\git rebase upstream/master; \
	cd ../sdl2-vapi && git fetch upstream &&\git rebase upstream/master; \
	cd ../tox-vapi && git fetch upstream &&\git rebase upstream/master; \
	cd ../tartrazine && git fetch upstream &&\git rebase upstream/master; \
	cd ../lairart && git fetch upstream &&\git rebase upstream/gh--pages; \
	cd ../lair-deb && git fetch upstream &&\git rebase upstream/gh-pages; \
	cd ../lair-msi && git fetch upstream &&\git rebase upstream/master; \
	cd ../lair-web && git fetch upstream &&\git rebase upstream/master; \
	echo "Pulled in updates"

pull:
	make commit
	make fetch

update:
	make commit
	repo sync --force-sync || make fetch

force-update:
	make clean; \
	rm -rf */* */.git */.repo .git/; \
	repo sync --force-sync || make fetch \
	make init

upload:
	\git push github master; \
	cd valair && \git push github mobs; \
	cd ../digitalandy && \git push github master; \
	cd ../sdl2-vapi && \git push github master; \
	cd ../tox-vapi && \git push github master; \
	cd ../tartrazine && \git push github master; \
	cd ../lairart && \git push github gh-pages; \
	cd ../lair-deb && \git push github gh-pages; \
	cd ../lair-msi && \git push github master; \
	cd ../lair-web && \git push github master;
	echo "Pushed Working Updates"

clean:
	cd valair && make clean; \
	cd ../digitalandy && make clean; \
	cd ../sdl2-vapi && make clean; \
	cd ../tox-vapi && make clean; \
	cd ../tartrazine && make clean; \
	cd ../lairart && make clean; \
	cd ../lair-deb && make clean; \
	cd ../lair-msi && make clean; \
	cd ../lair-web && make clean; \
	cd .. && rm *.buildinfo *.changes *.deb *.deb.md *.dsc *.tar.xz *.tar.gz *.debian.tar.xz *.debian.tar.gz *.orig.tar.gz *.orig.tar.zz *.sig; \
	echo "Finished cleaning"

lair:
	export VERSION=$(VERSION);cd valair && make deb-pkg || make deb-upkg
	cd valair && make windows

update-lair:
	export VERSION=$(VERSION);cd valair &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github mobs

digitalandy:
	export VERSION=$(VERSION);cd digitalandy && make deb-pkg || make deb-upkg
	cd valair && make windows

update-digitalandy:
	export VERSION=$(VERSION);cd digitalandy &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github mobs

sdl2:
	export VERSION=$(VERSION);cd sdl2-vapi && make deb-pkg

update-sdl2:
	export VERSION=$(VERSION);cd sdl2-vapi && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

tox:
	export VERSION=$(VERSION);cd tox-vapi && make deb-pkg

update-tox:
	export VERSION=$(VERSION);cd tox-vapi && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

yellow:
	export VERSION=$(VERSION);cd tartrazine && make deb-pkg

update-yellow:
	export VERSION=$(VERSION);cd tartrazine && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

art:
	export VERSION=$(VERSION);cd lairart && make && make deb-pkg || make deb-upkg
	cd lairart && make windows;

update-art:
	export VERSION=$(VERSION);cd lairart && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github gh-pages

msi:
	export VERSION=$(VERSION);cd lair-msi && make windows

update-msi:
	export VERSION=$(VERSION);cd lair-msi && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

web:
	rm -rf lair-web/lair-deb
	cp -R lair-deb lair-web/lair-deb
	rm -rf lair-web/lair-deb/.git

reweb:
	cd lair-web && make && git add . && git commit -am "new webpage ${COMMIT_MESSAGE}" ; git push github master

update-web:
	export VERSION=$(VERSION);cd lair-web && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

sign:
	export KEY=$(KEY); export GH_NAME=$(GH_NAME); ./.do_sign.sh

deb:
	rm lair-deb/packages/*
	cp lair_$(VERSION)-1_amd64.buildinfo \
		lair_$(VERSION)-1_amd64.changes \
		lair_$(VERSION)-1_amd64.deb \
		lair_$(VERSION)_amd64.deb.md \
		lair_$(VERSION)-1.debian.tar.xz \
		lair_$(VERSION)-1.dsc \
		lair_$(VERSION).orig.tar.gz \
		lair-dbgsym_$(VERSION)-1_amd64.deb \
		lair-dbgsym_$(VERSION)-1_amd64.deb.md \
		sdl2-vapi_2.0-1_amd64.deb \
		tartrazine_0.9-1_amd64.deb \
		tox-vapi_0.9-1_amd64.deb \
		lair-deb/packages; \
	cp lairart_$(VERSION)-1_amd64.buildinfo \
		lairart_$(VERSION)-1_amd64.changes \
		lairart_$(VERSION)-1_amd64.deb \
		lairart_$(VERSION)-1.debian.tar.xz \
		lairart_$(VERSION)-1.dsc \
		lairart_$(VERSION)-1.orig.tar.gz \
		lair-dbgsym_$(VERSION)_amd64.deb \
		lair-deb/packages; \
	cd lair-deb && ./apt-now

full:
	gpg --batch --yes --clear-sign -u $(KEY) README.md
	make lair
	make digitalandy
	make sdl2
	make tox
	make yellow
	make art
	make msi
	make deb
	make web
	echo "Rebuilt the whole suite"

push:
	gpg --batch --yes --clear-sign -u $(KEY) README.md
	make reweb
	make commit
	make upload

version:
	echo 'version placeholder'
	#cd valair && make release; \
	#cd ../sdl2-vapi && make release; \
	#cd ../tox-vapi && make release; \
	#cd ../tartrazine && make release; \
	#cd ../lairart && make release; \
	#cd ../lair-deb && make release; \
	#cd ../lair-msi && make release; \
	#cd ../lair-web && make release; \
	#echo 'Made new Version Numbers'

release:
	make version
	gpg --batch --yes --clear-sign -u $(KEY) README.md
	make full
	make sign
	make reweb
	make push
	repo sync

#Don't use this yet, it's teaching me about what needs to exist to make the code
#run modules and plugins from configrable locations right now.

run:
	./valair/bin/LAIR -v 9 \
		-m tiny \
		-p \
