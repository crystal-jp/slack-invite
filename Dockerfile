FROM manastech/crystal:0.7.4
MAINTAINER Pine Mizune <pinemz@gmail.com>

EXPOSE 8080

RUN sudo apt-get update
RUN sudo apt-get install -y --no-install-recommends git # for crystal deps
RUN sudo apt-get install -y --no-install-recommends libyaml-dev # for YAML

ADD . /opt/slack-invite
WORKDIR /opt/slack-invite

RUN crystal --version
RUN crystal deps
RUN crystal build src/app.cr -o slack-invite --release

ENTRYPOINT PORT=8080 ./slack-invite
