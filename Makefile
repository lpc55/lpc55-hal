build:
	cargo build

# External documentation
fetch-docs:
	mkdir -p ref
	curl -s https://www.nxp.com/docs/en/data-sheet/LPC55S6x.pdf \
		-o ref/datasheet-lpc55s6x.pdf
	curl -s https://www.nxp.com/docs/en/user-guide/UM11126.pdf \
		-o ref/usermanual-lpc55s6x.pdf
	curl -sk https://static.docs.arm.com/100235/0004/arm_cortex_m33_dgug_100235_0004_00_en.pdf \
		-o ref/genericuserguide-cortexm33.pdf

# Maintenance
VERSION_FILE := "VERSION"
VERSION := $(shell cat $(VERSION_FILE))
tag:
	git tag -a $(VERSION) -m"v$(VERSION)"
	git push origin $(VERSION)

