# CLAUDE.md

## Project

Cucumber JVM example project using Scala 3 step definitions.

## Stack

- Scala 3 + Cucumber Scala DSL (`ScalaDsl with EN`)
- Cucumber JVM 7 (cucumber-junit-platform-engine)
- JUnit 5 (junit-jupiter + junit-platform-suite)
- SLF4J + Logback
- Maven (wrapper: `./mvnw`)
- Docker (Ubuntu 24.04 + OpenJDK 25)

## Key Files

- `src/main/resources/features/` — Gherkin feature files
- `src/main/scala/steps/` — Step definitions
- `src/test/scala/runner/` — JUnit 5 suite runners
- `src/test/resources/junit-platform.properties` — Cucumber config (glue, tags, plugins)
- `pom.xml` — Maven build
- `Makefile` — `make dist`, `make image`, `make all`
- `docker-entrypoint.sh` — Container entrypoint

## Common Commands

```bash
./mvnw clean test                  # build and test
./mvnw clean package               # build shaded jar
make all                           # build jar + Docker image
make image                         # Docker image only
./run-all-tests-using-jar.sh       # run via shaded jar (Cucumber CLI)
./run-all-tests-using-plugin.sh    # run via maven exec plugin
```

## Conventions

- Feature files live in `src/main/resources/features/` (on the main classpath, included in the shaded jar)
- Step definitions are in the `steps` package
- Test runners use `@Suite` + `@IncludeEngines("cucumber")` + `@SelectClasspathResource`
- Cucumber options (glue, tags, plugins) go in `junit-platform.properties`, not on the runner class
- Use `./mvnw` (not `mvn`) for all Maven commands
- The shaded jar's main class is `io.cucumber.core.cli.Main`
