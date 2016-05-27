package steps

import cucumber.api.scala.{EN, ScalaDsl}
import org.slf4j.LoggerFactory

class ExampleSteps extends ScalaDsl with EN {
  private val log = LoggerFactory.getLogger(classOf[ExampleSteps])

  Before { scenario =>
    log.info("Before...")
  }
  After { scenario =>
    log.info("...After")
  }

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
