#!/usr/bin/env bash
PLUGINS="--plugin pretty --plugin html:cucumber/index.html --plugin json:cucumber/json/cucumber.json"
java -jar target/cucumber-jvm-scala-example.jar ${PLUGINS} --glue steps classpath:features  --tags "not @Wip" --tags @ExampleFeature --threads 8
