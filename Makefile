build-both:
	cargo build
	cargo build --release

view-rtfm-expansion:
	rustfmt target/rtfm-expansion.rs
	vi target/rtfm-expansion.rs

# turn off the LEDs and whatnot
darkness:
	gdb-multiarch -q -x darkness.gdb > /dev/null 2> /dev/null

#
# External documentation
#

fetch-docs:
	mkdir -p ref
	curl -s https://www.nxp.com/docs/en/data-sheet/LPC55S6x.pdf \
		-o ref/datasheet-lpc55s6x.pdf
	curl -s https://www.nxp.com/docs/en/user-guide/UM11126.pdf \
		-o ref/usermanual-lpc55s6x.pdf
	curl -s https://www.nxp.com/docs/en/errata/ES_LPC55S6x.pdf \
		-o ref/errata-lpc55s6x.pdf
	curl -sk https://static.docs.arm.com/100235/0004/arm_cortex_m33_dgug_100235_0004_00_en.pdf \
		-o ref/genericuserguide-cortexm33.pdf
	curl -s https://www.segger.com/downloads/jlink/UM08001 \
		-o ref/userguide-jlink.pdf
	curl -s https://www.segger.com/downloads/jlink/UM08036 \
		-o ref/gdbextensions-jlink.pdf

#
# Maintenance
#

VERSION := $(shell grep version Cargo.toml|head -1|cut -d' ' -f 3|tr -d '"')
version:
	echo $(VERSION)

tag:
	git tag -a $(VERSION) -m"v$(VERSION)"
	git push origin $(VERSION)

#
# CI
#

rustup:
	rustup target add thumbv8m.main-none-eabi
	rustup target add thumbv8m.main-none-eabihf
	rustup update

build-examples-verbosely:
	cargo build --verbose --examples
	cargo build --verbose --examples --release

#
# For running examples
#

# jlink:
# 	JLinkGDBServer -device LPC55S69 -if SWD
jlink:
	scripts/jlink

stop-jlink:
	pkill JLinkGDBServer

EXAMPLE := led

build-example:
	cargo build --example $(EXAMPLE)

build-example-release:
	cargo build --example $(EXAMPLE) --release

run-example:
	cargo run --example $(EXAMPLE)

run-example-release:
	cargo run --example $(EXAMPLE) --release

sizes-example:
	cargo size --example $(EXAMPLE)
	cargo size --example $(EXAMPLE) --release


