FROM maven:3.3-jdk-8

RUN apt-get update && apt-get install bats

ENV SONAR_RUNNER_VERSION 2.4
ENV SONAR_RUNNER_HOME /opt/sonar-runner-${SONAR_RUNNER_VERSION}
ENV SONAR_RUNNER_PACKAGE sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip
ENV HOME ${SONAR_RUNNER_HOME}
ENV PATH "$PATH:${SONAR_RUNNER_HOME}/bin"
WORKDIR /opt

RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/${SONAR_RUNNER_VERSION}/${SONAR_RUNNER_PACKAGE} \
 && unzip sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip \
 && rm ${SONAR_RUNNER_PACKAGE}

#RUN groupadd -r sonar \
# && useradd -r -s /usr/sbin/nologin -d ${SONAR_RUNNER_HOME} -c "Sonar service user" -g sonar sonar \
# && chown -R sonar:sonar ${SONAR_RUNNER_HOME} \
# && mkdir -p /data \
# && chown -R sonar:sonar /data
# USER sonar

WORKDIR /data

VOLUME /data
RUN echo "" >> ${SONAR_RUNNER_HOME}/conf/sonar-runner.properties
RUN echo sonar.host.url=http://192.168.99.100:9000 >> ${SONAR_RUNNER_HOME}/conf/sonar-runner.properties

#ENTRYPOINT ${SONAR_RUNNER_HOME}/bin/sonar-runner
CMD ["mvn","sonar-runner","bats"]
