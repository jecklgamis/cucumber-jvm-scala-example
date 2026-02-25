#!/usr/bin/env bash
mvn exec:java \
  -Dcucumber.plugin="pretty,html:cucumber/index.html,json:cucumber/json/cucumber.json" \
  -Dcucumber.filter.tags="not @Wip and @ExampleFeature" \
  -Dcucumber.glue="steps" \
  -Dcucumber.features="classpath:features"
