#!/usr/bin/env bash
set -ex
java -jar target/cucumber-jvm-scala-example.jar --plugin pretty --glue steps classpath:features --tags ~@Wip --tags @ExampleFeature
