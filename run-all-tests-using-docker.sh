#!/usr/bin/env bash

IMAGE_NAME=cucumber-jvm-scala-example
IMAGE_TAG=main
JAVA_OPTS=${JAVA_OPTS:-""}
ARGS=${ARGS:-"--plugin pretty --plugin html:cucumber/index.html --plugin json:cucumber/json/cucumber.json --glue steps classpath:features --tags @ExampleFeature"}
docker run -e "JAVA_OPTS=${JAVA_OPTS}" -e "ARGS=${ARGS}" ${IMAGE_NAME}:${IMAGE_TAG}
