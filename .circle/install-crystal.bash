#!/bin/bash

if type -p crystal >/dev/null 2>&1; then
    exit
fi

crenv install `cat .crystal-version`

