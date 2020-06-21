package runner

import io.cucumber.junit.{Cucumber, CucumberOptions}
import org.junit.runner.RunWith

@RunWith(classOf[Cucumber])
@CucumberOptions(
  features = Array("classpath:features/Example.feature"),
  tags = "not @Wip",
  glue = Array("classpath:steps"),
  plugin = Array("pretty", "html:target/cucumber/html"))
class ExampleFeatureRunnerTest

