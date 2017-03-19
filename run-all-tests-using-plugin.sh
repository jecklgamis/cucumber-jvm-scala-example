#!/usr/bin/env bash
set -ex
PLUGINS="--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json"
mvn exec:java -Dcucumber.options="${PLUGINS} --tags ~@Wip --tags @ExampleFeature --glue steps classpath:features"
