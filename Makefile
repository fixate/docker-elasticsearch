all: build

.PHONY: all build push

build:
	docker build -t fixate/elasticsearch:1.2.1 .

push:
	docker push fixate/elasticsearch
