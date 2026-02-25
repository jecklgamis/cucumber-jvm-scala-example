package runner

import org.junit.platform.suite.api.{IncludeEngines, SelectClasspathResource, Suite}

@Suite
@IncludeEngines(Array("cucumber"))
@SelectClasspathResource("features/Example.feature")
class ExampleFeatureRunnerTest
