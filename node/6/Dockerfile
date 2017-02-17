FROM node:6

RUN apt-get update
RUN apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm \
    && rvm install 2.3.1 \
    && rvm use 2.3.1 --default \
    && gem install compass"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app
ONBUILD RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm  \
        && ./node_modules/.bin/grunt prod"
