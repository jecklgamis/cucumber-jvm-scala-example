import cucumber.runtime.io.{MultiLoader, ResourceLoaderClassFinder}
import cucumber.runtime.{Env, RuntimeOptions}

import scala.collection.JavaConversions.seqAsJavaList

object CucumberTestMain {
  val featurePaths = Array("classpath:features")
  val gluePaths = Array("classpath:steps")

  def main(args: Array[String]): Unit = {
    val classLoader = Thread.currentThread().getContextClassLoader()
    val resourceLoader = new MultiLoader(classLoader)
    val classFinder = new ResourceLoaderClassFinder(resourceLoader, classLoader)
    val runtime = new cucumber.runtime.Runtime(resourceLoader, classFinder, classLoader, getRuntimeOptions(args))
    runtime.run()
    System.exit(runtime.exitStatus())
  }

  def getRuntimeOptions(argv: Array[String]): RuntimeOptions = {
    val runtimeOptions = new RuntimeOptions(new Env(System.getProperties()), argv.toList)
    featurePaths.foreach { path => runtimeOptions.getFeaturePaths.add(path) }
    gluePaths.foreach { path => runtimeOptions.getGlue.add(path) }
    runtimeOptions
  }
}
