#!/usr/bin/env bash
PLUGINS="--plugin pretty --plugin html:cucumber/index.html --plugin json:cucumber/json/cucumber.json"
mvn exec:java -Dcucumber.options="${PLUGINS} --tags 'not @Wip' --tags @ExampleFeature --glue steps classpath:features"
