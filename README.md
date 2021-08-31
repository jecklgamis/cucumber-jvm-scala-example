## Cucumber JVM Scala Example 

[![Build](https://github.com/jecklgamis/cucumber-jvm-scala-example/actions/workflows/build.yml/badge.svg)](https://github.com/jecklgamis/cucumber-jvm-scala-example/actions/workflows/build.yml)

This is an example Cucumber-JVM project.

* Uses Scala step definitions
* Packages tests into executable jar file

## Getting Started

If you're new to Cucumber testing, start with `https://cucumber.io/docs`. Otherwise, run the example
test in IDE or command line (see Running Cucumber Tests).

## Essential Elements

* Feature files - contains the BDD feature definitions (Gherkin, e.g. `Example.feature`)
* Step definitions - Implementation of the step definitions (Scala, e.g. `ExampleSteps.scala`)
* Test runners - run specific feature set ( Scala with Junit annotations, e.g. `ExampleTestRunner.scala`). 

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

### Creating Test Runner
See the example below and change the appropriate values of the CucumberOptions annotation.

```
@RunWith(classOf[Cucumber])
@CucumberOptions(
  features = Array("classpath:features/Example.feature"),
  tags = Array("not @Wip"),
  glue = Array("classpath:steps"),
  plugin = Array("pretty", "html:target/cucumber/html"))
class ExampleFeatureRunner
```
* This runs all scenarios in `Example.feature` not tagged with `@Wip`
* The step definitions are loaded from class path `steps`
* This generates reports in `target/cucumber/html` folder relative to some execution path

### ANDing, NEGating, and ORing Cucumber Tags

* `not` negates a tag
* Comma separated tags are ORed (example `tags = Array("@FeatureSet1,@FeatureSet2")` means run both feature sets)
* Separated tags are ANDed (example `tags = Array("not @Wip","@FeatureSet1")` means run `@FeatureSet1` but not those tagged with `@Wip`)

### Implementing Steps/Glue
After you create the feature files, run the test runner, it will give you hints on the missing steps you need to implement

Example (`ExampleSteps.scala`)
```
Given("""^this pre condition$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
  When("""^I do this$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
  Then("""^I can verify that$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
  Then("""^I can also verify that$""") { () =>
    //// Write code here that turns the phrase above into concrete actions
  }
}
```

### Running Cucumber Tests from CLI

Using maven test:
```
mvn test
```

Using executable jar file:
```
mvn clean package
PLUGINS="--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json"
java -jar target/cucumber-jvm-scala-example.jar ${PLUGINS} --glue steps classpath:features  --tags "not @Wip" --tags @ExampleFeature
```

Using maven exec:plugin: 
```
PLUGINS="--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json"
mvn exec:java -Dcucumber.options="${PLUGINS} --tags @ExampleFeature --tags 'not @Wip' --glue steps classpath:features"
```

The above command line examples generate reports in `cucumber/html` and in  `cucumber/json` directories.

Using Docker:

Build Docker image (see `build-docker-image.sh`)
```shell script
IMAGE_NAME=jecklgamis/cucumber-jvm-scala-example
IMAGE_TAG=latest
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
```

Run Docker image (see `run-all-tests-using-docker.sh`)
```shell script
IMAGE_NAME=jecklgamis/cucumber-jvm-scala-example
IMAGE_TAG=latest

JAVA_OPTS=${JAVA_OPTS:-""}
ARGS=${ARGS:-"--plugin pretty --plugin html:cucumber/html --plugin json:cucumber/json/cucumber.json --glue steps classpath:features --tags @ExampleFeature"}

docker run -e "JAVA_OPTS=${JAVA_OPTS}" -e "ARGS=${ARGS}" ${IMAGE_NAME}:${IMAGE_TAG}
```

## Running Cucumber Tests from IDE

Intellij:
```
In the `Run/Debug Configuration` , add the steps directories (in this example, `steps`) in the `Glue` text field
and right click on a specific feature then click Run.
```

## Sharing State In Steps
* A number of options here, instance variables, thread local map.

## Other Cucumber-JVM Examples 
* https://github.com/jecklgamis/cucumber-jvm-scala-example
* https://github.com/jecklgamis/cucumber-jvm-kotlin-example

## Links
* https://cucumber.io/docs
* http://github.com/cucumber/cucumber-jvm



