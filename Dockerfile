FROM ubuntu:24.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y openjdk-21-jre-headless && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
RUN mkdir -m 0755 -p $APP_HOME
COPY target/cucumber-jvm-scala-example.jar $APP_HOME

RUN groupadd -r app && useradd -r -gapp app
RUN chown -R app:app $APP_HOME

WORKDIR $APP_HOME
USER app
CMD ["/docker-entrypoint.sh"]
COPY docker-entrypoint.sh /


