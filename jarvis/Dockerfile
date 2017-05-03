#FROM maven:3.3-jdk-8
FROM gradle:3.5-jdk8
USER root
RUN apt-get update && apt-get install bats

#################

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.10.1.0
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

# Install Kafka, Zookeeper and other needed things
RUN apt-get update && \
    apt-get install -y zookeeper wget supervisor dnsutils && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh
RUN ln -s $KAFKA_HOME /opt/kafka

# Supervisor config
ADD supervisor/kafka.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/

############


ENV SONAR_RUNNER_VERSION 2.4
ENV SONAR_RUNNER_HOME /opt/sonar-runner-${SONAR_RUNNER_VERSION}
ENV SONAR_RUNNER_PACKAGE sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip
ENV HOME ${SONAR_RUNNER_HOME}
ENV PATH "$PATH:${SONAR_RUNNER_HOME}/bin"
WORKDIR /opt

RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/${SONAR_RUNNER_VERSION}/${SONAR_RUNNER_PACKAGE} \
 && unzip sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip \
 && rm ${SONAR_RUNNER_PACKAGE}

WORKDIR /data

VOLUME /data
RUN echo "" >> ${SONAR_RUNNER_HOME}/conf/sonar-runner.properties
RUN echo sonar.host.url=http://sonar.qubeship.io >> ${SONAR_RUNNER_HOME}/conf/sonar-runner.properties





#ENTRYPOINT ${SONAR_RUNNER_HOME}/bin/sonar-runner
CMD ["mvn","sonar-runner","bats"]
