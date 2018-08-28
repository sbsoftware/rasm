default: build

wasmception.BUILT:
	cd wasmception; make; cd ../
	touch wasmception.BUILT

mruby.BUILT: wasmception.BUILT
	PATH=${PWD}/wasmception/dist/bin:${PATH}; cd mruby; make; cd ../
	touch mruby.BUILT

build: mruby.BUILT

install:
	ln -s ${PWD}/bin/rasm /usr/local/bin/rasm

clean-mruby:
	cd mruby; make clean; cd ../
	rm mruby.BUILT

clean: clean-mruby
	rm /usr/local/bin/rasm
	cd wasmception; make clean; cd ../
	rm wasmception.BUILT

.PHONY: default build clean-mruby clean install
