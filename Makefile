.PHONY: all clean build run

DOCKER:=$(firstword $(shell which docker) $(shell which finch))

all: build

clean:
	rm -rf build/

BASE:=bare-metal-dev
IMAGES:=alpine arch ubuntu

define build_image
build/$(1)_image_inspect.txt: $(1)/Containerfile
	mkdir -p build
	$(DOCKER) build $(1) -f $$< --tag $(BASE)-$(1)
	$(DOCKER) inspect $(BASE)-$(1) > build/$(1)_image_inspect.txt

build:: build/$(1)_image_inspect.txt
endef

define run_image
build/$(1)_run_output.txt: build/$(1)_image_inspect.txt
	mkdir -p build
	$(DOCKER) run $(BASE)-$(1) /usr/bin/python3 -c "import uuid; print(uuid.uuid4())" > build/$(1)_run_output.txt

run:: build/$(1)_run_output.txt
endef

$(foreach img,$(IMAGES),$(eval $(call build_image,$(img))))
$(foreach img,$(IMAGES),$(eval $(call run_image,$(img))))
