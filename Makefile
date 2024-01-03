.PHONY: posix help test clean prepare dist

posix help test clean:
	@cd src && $(MAKE) $@

prepare:
	curl https://raw.githubusercontent.com/wasienv/wasienv/master/install.sh | sh
	wasienv install-sdk unstable
	npm install

dist:
	mkdir -p dist
	cp src/lua.wasm dist/
