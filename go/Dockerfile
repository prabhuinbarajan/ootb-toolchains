FROM golang:1.8

RUN apt-get update && apt-get install unzip

ENV SONAR_RUNNER_VERSION 2.4
ENV SONAR_RUNNER_HOME /opt/sonar-runner-${SONAR_RUNNER_VERSION}
ENV SONAR_RUNNER_PACKAGE sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip
#ENV HOME ${SONAR_RUNNER_HOME}
ENV HOME /home/app
ENV GOPATH "/home/app"
ENV PATH "$PATH:${SONAR_RUNNER_HOME}/bin:${GOPATH}/bin"
WORKDIR /opt
RUN mkdir -p /home/app/src/github.com

RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/${SONAR_RUNNER_VERSION}/${SONAR_RUNNER_PACKAGE} \
 && unzip sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip \
 && rm ${SONAR_RUNNER_PACKAGE}

WORKDIR /data

VOLUME /data
RUN echo "" >> ${SONAR_RUNNER_HOME}/conf/sonar-runner.properties
RUN echo sonar.host.url=http://sonar.qubeship.io >> ${SONAR_RUNNER_HOME}/conf/sonar-runner.properties

#ENTRYPOINT ${SONAR_RUNNER_HOME}/bin/sonar-runner
CMD ["go","sonar-runner","bats"]
