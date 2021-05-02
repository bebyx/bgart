all: install

install:
	mkdir -p ${HOME}/.local/lib/bgart/
	cp ./bgart.pl ${HOME}/.local/lib/bgart/
	cp -r ./mods ${HOME}/.local/lib/bgart/
	ln -s ${HOME}/.local/lib/bgart/bgart.pl ${HOME}/.local/bin/bgart

uninstall:
	rm ${HOME}/.local/bin/bgart
	cd ${HOME}/.local/lib && rm -r ./bgart/

setlocal:
	mkdir -p ${HOME}/.local/bin/
	mkdir -p ${HOME}/.local/lib/
	export PATH="${HOME}/.local/bin:${PATH}"
