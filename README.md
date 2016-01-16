slack-invite
------------

[![Circle CI](https://img.shields.io/circleci/project/crystal-jp/slack-invite/master.svg)](https://circleci.com/gh/crystal-jp/slack-invite/tree/master)
[![Dependency Status](https://shards.rocks/badge/github/crystal-jp/slack-invite/status.svg)](https://shards.rocks/github/crystal-jp/slack-invite)
[![devDependency Status](https://shards.rocks/badge/github/crystal-jp/slack-invite/dev_status.svg)](https://shards.rocks/github/crystal-jp/slack-invite)

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
Crystal 0.10.0 [9d59a34] (Wed Dec 23 17:24:02 UTC 2015)
$ crystal deps # Install dependencies
$ crystal build src/app.cr # Compile
$ ./app --port 8080 # Run!
```

## Author
[Pine Mizune](https://github.com/pine613)
