IMAGE_NAME:=jecklgamis/cucumber-jvm-scala-example
IMAGE_TAG:=$(shell git rev-parse HEAD)
default:
	cat ./Makefile
dist:
	./mvnw clean package
image:
	 docker build -t $(IMAGE_NAME):$(IMAGE_TAG) -t $(IMAGE_NAME):latest .
run:
	 docker run $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	 docker run -it $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
all: dist image
push:
	 docker push $(IMAGE_NAME):$(IMAGE_TAG)
	 docker push $(IMAGE_NAME):latest
tag:
	 git tag -m "cucumber-jvm-scala-example-v$(IMAGE_TAG)" -a "v$(IMAGE_TAG)"
	 git push --tags


