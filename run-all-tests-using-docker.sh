#!/usr/bin/env bash

IMAGE_NAME=jecklgamis/cucumber-jvm-scala-example
IMAGE_TAG=latest

JAVA_OPTS=${JAVA_OPTS:-""}
ARGS=${ARGS:-"--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json --glue steps classpath:features --tags @ExampleFeature"}

docker run -e "JAVA_OPTS=${JAVA_OPTS}" -e "ARGS=${ARGS}" ${IMAGE_NAME}:${IMAGE_TAG}
