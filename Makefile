IMAGE  ?= filefrog/ytdl:latest
GITHUB := https://github.com/filefrog/ytdl

.PHONY: default build push
default: build
build:
	docker build \
	  --build-arg BUILD_DATE="$(shell date -u +%Y-%m-%d)" \
	  --build-arg VCS_REF="$(shell git rev-parse --short HEAD)" \
	  -t $(IMAGE) .

push: build
	docker push $(IMAGE)
