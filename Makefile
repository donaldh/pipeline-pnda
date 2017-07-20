
build:	## Build the pipeline docker image
	docker build -t pipeline docker

run:	## Start the pipeline container
	docker run -d --net=host --volume $(PWD)/data:/data --name pipeline pipeline

stop:	## Stop the pipeline container
	docker kill pipeline

help:	## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help
.DEFAULT_GOAL := help
