all: build

.PHONY: all build push

build:
	docker build -t fixate/elasticsearch:1.0 .

push:
	docker push fixate/elasticsearch
