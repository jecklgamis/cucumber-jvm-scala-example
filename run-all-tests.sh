#!/usr/bin/env bash
java -Dcucumber.options="--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json --tags ~@Wip" -jar target/cucumber-jvm-scala-example.jar
