all: build

.PHONY: all build push

build:
	docker build -rm -t fixate/elasticsearch:12.04 .

push:
	docker push fixate/elasticsearch
