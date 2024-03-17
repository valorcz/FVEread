.DEFAULT_GOAL := build
IMAGE ?= fve_toolkit:latest

build: Dockerfile
	docker buildx build . -t $(IMAGE)

debug:
	docker run -it --entrypoint sh $(IMAGE)

run:
	$(eval PWD=$(shell pwd))
	docker run $(IMAGE)

# Removes all the running containers
# TODO: this should only target $IMAGE instances
cleanup:
	$(eval CONTAINERS=$(shell docker container ls -aq))
	docker container rm $(CONTAINERS)
