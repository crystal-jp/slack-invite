slack-invite
------------

[![Circle CI](https://img.shields.io/circleci/project/crystal-jp/slack-invite/master.svg?style=flat-square)](https://circleci.com/gh/crystal-jp/slack-invite/tree/master)

Automatic inviting in Slack Team for Crystal-JP.

## Install & Run
It's very easy to run this service if you had installed [Docker](https://www.docker.com/) your system.

```
$ docker build -t crystal-jp/slack-invite .
$ docker run -it -p $PORT:8080 crystal-jp/slack-invite
```

## Development
You need to install Crystal compiler.

```
$ crystal --version
Crystal 0.7.4 [42efdbf] (Wed Jun 24 01:02:21 UTC 2015)
$ crystal deps # Install dependencies
$ crystal build src/app.cr # Compile
$ PORT=$PORT ./app # Run!
```

## Author
[Pine Mizune](https://github.com/pine613)
