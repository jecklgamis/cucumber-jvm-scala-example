#!/bin/bash
set -ex
cd /cucumber-jvm-scala-example
JAVA_OPTS=${JAVA_OPTS:-""}
ARGS=${ARGS:-"--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json --glue steps classpath:features --tags @ExampleFeature"}
java -jar cucumber-jvm-scala-example.jar ${JAVA_OPTS} ${ARGS}
