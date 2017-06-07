#!/bin/bash
#docker build -t qubeship/qube-java-nodejs -f Dockerfile .
docker build -t qubeship/qube-java-nodejs -f Dockerfile-debian .
#docker-squash -f 2 -t qubeship/qube-java-nodejs:squashed qubeship/qube-java-nodejs:latest
