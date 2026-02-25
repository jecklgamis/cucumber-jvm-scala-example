## Cucumber JVM Scala Example

[![Build](https://github.com/jecklgamis/cucumber-jvm-scala-example/actions/workflows/build.yml/badge.svg)](https://github.com/jecklgamis/cucumber-jvm-scala-example/actions/workflows/build.yml)

## Requirements
* JDK 25

This is an example Cucumber-JVM project.

* Uses Scala 3 step definitions
* Packages tests into executable jar file

## Getting Started

If you're new to Cucumber testing, start with `https://cucumber.io/docs`. Otherwise, run the example
test in IDE or command line (see Running Cucumber Tests).

## Essential Elements

* Feature files - contains the BDD feature definitions (Gherkin, e.g. `Example.feature`)
* Step definitions - Implementation of the step definitions (Scala, e.g. `ExampleSteps.scala`)
* Test runners - run specific feature set (Scala with JUnit 5 annotations, e.g. `ExampleFeatureRunnerTest.scala`)

## Creating Tests

* Create or update feature file in `src/main/resources/features`
* Implement or update steps in `src/main/scala/steps`
* Create or update test runner in `src/test/scala/runner` with the appropriate tags

Intellij :
* Install Scala plugin
* Install Cucumber for Scala plugin (this allows easy navigation of glue steps)

### Creating Feature Files

Example
```
Feature: Example feature

  @ExampleFeature
  Scenario: Example scenario
    Given this pre condition
    And this pre condition
    When I do this
    And I do this
    Then I can verify that
    And I can also verify that
```

### Creating Test Runners

Use the JUnit 5 Platform Suite API:

```scala
import org.junit.platform.suite.api.{IncludeEngines, SelectClasspathResource, Suite}

@Suite
@IncludeEngines(Array("cucumber"))
@SelectClasspathResource("features/Example.feature")
class ExampleFeatureRunnerTest
```

Configure glue, tag filters, and plugins in `src/test/resources/junit-platform.properties`:

```properties
cucumber.glue=steps
cucumber.filter.tags=not @Wip and @ExampleFeature
cucumber.plugin=pretty,html:target/cucumber/html
```

### ANDing, NEGating, and ORing Cucumber Tags

* `not` negates a tag
* `and` ANDs tags (e.g. `not @Wip and @ExampleFeature`)
* `or` ORs tags (e.g. `@FeatureSet1 or @FeatureSet2`)

### Implementing Steps/Glue
After you create the feature files, run the test runner — it will give you hints on the missing steps you need to implement.

Example (`ExampleSteps.scala`)
```scala
class ExampleSteps extends ScalaDsl with EN {
  Given("""^this pre condition$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
  When("""^I do this$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
  Then("""^I can verify that$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
}
```

### Running Cucumber Tests from CLI

Using Maven test:
```
./mvnw test
```

Using executable jar file:
```
./mvnw clean package
./run-all-tests-using-jar.sh
```

Using Maven exec plugin:
```
./run-all-tests-using-plugin.sh
```

The above commands generate reports in `cucumber/html` and `cucumber/json` directories.

Using Docker:

Build Docker image:
```shell
make all
```

Run Docker image (see `run-all-tests-using-docker.sh`):
```shell
IMAGE_NAME=cucumber-jvm-scala-example
IMAGE_TAG=main

JAVA_OPTS=${JAVA_OPTS:-""}
ARGS=${ARGS:-"--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json --glue steps classpath:features --tags @ExampleFeature"}

docker run -e "JAVA_OPTS=${JAVA_OPTS}" -e "ARGS=${ARGS}" ${IMAGE_NAME}:${IMAGE_TAG}
```

## Running Cucumber Tests from IDE

Intellij:
```
In the `Run/Debug Configuration`, add the steps directories (in this example, `steps`) in the `Glue` text field
and right click on a specific feature then click Run.
```

## Sharing State In Steps
* A number of options here: instance variables, thread local map.

## Other Cucumber-JVM Examples
* https://github.com/jecklgamis/cucumber-jvm-scala-example
* https://github.com/jecklgamis/cucumber-jvm-kotlin-example

## Links
* https://cucumber.io/docs
* http://github.com/cucumber/cucumber-jvm
