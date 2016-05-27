#!/usr/bin/env bash
set -ex
mvn exec:java -Dcucumber.options="--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json --tags ~@Wip --tags @ExampleFeature"