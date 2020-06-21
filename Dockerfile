FROM jecklgamis/openjdk-8-jre:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN mkdir -m 0755 -p /cucumber-jvm-scala-example

COPY target/cucumber-jvm-scala-example.jar /cucumber-jvm-scala-example
COPY docker-entrypoint.sh /cucumber-jvm-scala-example

CMD ["/cucumber-jvm-scala-example/docker-entrypoint.sh"]

