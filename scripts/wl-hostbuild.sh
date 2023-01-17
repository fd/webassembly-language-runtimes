#!/usr/bin/env bash

if [[ ! -v WASMLABS_ENV ]]
then
    echo "Wasmlabs environment is not set"
    exit 1
fi

if [[ ! -v WASI_SDK_ROOT ]]
then
    echo "Please set WASI_SDK_ROOT and run again"
    exit 1
fi

env -u CC -u LD -u CXX -u NM -u AR -u RANLIB $@ || exit 1
