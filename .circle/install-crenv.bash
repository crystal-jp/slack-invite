#!/bin/bash

echo 'export PATH="$HOME/.crenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(crenv init -)"' >> ~/.bashrc

if [ -d "$HOME/.crenv" ]; then
    exit
fi

git clone https://github.com/pine613/crenv ~/.crenv
git clone https://github.com/pine613/crystal-build.git ~/.crenv/plugins/crystal-build
