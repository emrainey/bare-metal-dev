.PHONY: all clean build run

DOCKER:=$(firstword $(shell which docker) $(shell which finch))

all: build

clean:
	rm -rf build/

BASE:=bare-metal-dev
IMAGES:=alpine debian ubuntu # arch # (problem child!)

# Moved the CMake download to individual Containerfiles
# as the Github workflow kept failing. This path is here in case something else breaks.
DOWNLOADS:=

# $1 is the notdir name of the file
# $2 is the URL of the file
define download_dependency
build/$(1):
	mkdir -p build
	curl -L $(2) -o $$@
	chmod +x $$@
endef

# Target dependencies depends on all the scripts being downloaded
dependencies: $(foreach dep,$(DOWNLOADS),build/$(notdir $(dep)))

# Each script is based on the corresponding download URL
$(foreach dep,$(DOWNLOADS),$(eval $(call download_dependency,$(notdir $(dep)),$(dep))))

define build_image
build/$(1)_image_inspect.txt: Containerfile.$(1) dependencies
	mkdir -p build
	$(DOCKER) build . --ssh default -f $$< --tag $(BASE)-$(1)
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
