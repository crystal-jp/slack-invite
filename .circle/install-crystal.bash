#!/bin/bash

CRYSTAL_VERSION=`cat .crystal-version`

if crenv versions | grep $CRYSTAL_VERSION; then
    exit
fi

crenv install `cat .crystal-version`

