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
	node_modules/.bin/esbuild src/index.js --minify --target=es2021 --format=esm --outfile=dist/index.js
