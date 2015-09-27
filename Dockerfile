FROM manastech/crystal:0.8.0
MAINTAINER Pine Mizune <pinemz@gmail.com>

EXPOSE 8080

RUN apt-get update
RUN apt-get install -y --no-install-recommends git # for crystal deps
RUN apt-get install -y --no-install-recommends libyaml-dev # for YAML

RUN git config --global http.sslVerify false

RUN git clone --depth 1 -b v0.4.0 https://github.com/ysbaddaden/shards.git
WORKDIR shards
RUN crystal build ./src/shards.cr -o ./bin/shards
RUN cp ./bin/shards /usr/bin/shards
WORKDIR ..
RUN rm -rf shards

RUN apt-get clean -y
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD . /opt/slack-invite
WORKDIR /opt/slack-invite

RUN rm -rf libs
RUN rm -rf .crystal
RUN rm -rf .shards
RUN rm -rf bin

RUN crystal --version
RUN shards --version
RUN shards install
RUN mkdir -p bin
RUN crystal build src/app.cr -o ./bin/slack-invite --release

ENTRYPOINT PORT=8080 ./bin/slack-invite
