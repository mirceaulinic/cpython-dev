VERSION ?= $(shell git describe --tags --always --dirty="-dev")
TAG ?= mirceaulinic/cpython-dev:$(VERSION)

CURDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CPYTHON_DIR ?= $(abspath $(CURDIR)/../cpython)

build:
	docker build . -t $(TAG)

run:
	docker run --rm -v $(CPYTHON_DIR):/cpython/ -w /cpython/ -ti $(TAG) bash
