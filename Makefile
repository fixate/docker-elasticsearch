all: build

.PHONY: all build push

build:
	docker build -rm -t fixate/elasticsearch:1.0.0 .

push:
	docker push fixate/elasticsearch
