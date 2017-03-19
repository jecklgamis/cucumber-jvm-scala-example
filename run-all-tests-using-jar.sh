#!/usr/bin/env bash
set -ex
PLUGINS="--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json"
java -jar target/cucumber-jvm-scala-example.jar ${PLUGINS} --glue steps classpath:features  --tags ~@Wip --tags @ExampleFeature
