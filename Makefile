VENDOR_VERSION ?= 2.0.18
REGISTRY ?= docker.io
ifeq ($(BUILD_VERSION),)
	BUILD_VERSION := $(shell git describe --tags `git rev-list --tags --max-count=1`)
endif
VERSION := $(VENDOR_VERSION)-$(BUILD_VERSION)

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/poste.io:$(VERSION)

build:
	docker build --build-arg VENDOR_VERSION=$(VENDOR_VERSION) --no-cache --rm=true -t $(REGISTRY)/bborbe/poste.io:$(VERSION) .

shell:
	docker run -i -t $(REGISTRY)/bborbe/poste.io:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/poste.io:$(VERSION)
