#!/usr/bin/env bash

if [[ ! -v WASMLABS_ENV ]]
then
    echo "Wasmlabs environment is not set"
    exit 1
fi

if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script to add to CFLAGS and LDFLAGS: \$ source $0" >&2
    return
fi

logStatus "Building dependencies... "

### uuid
$WASMLABS_MAKE ${WASMLABS_REPO_ROOT}/libs/uuid/libuuid-1.0.3 || exit 1

export CFLAGS_DEPENDENCIES="-I${WASMLABS_OUTPUT_BASE}/uuid/libuuid-1.0.3/include ${CFLAGS_DEPENDENCIES}"
export LDFLAGS_DEPENDENCIES="-L${WASMLABS_OUTPUT_BASE}/uuid/libuuid-1.0.3/lib ${LDFLAGS_DEPENDENCIES}"


### zlib
$WASMLABS_MAKE ${WASMLABS_REPO_ROOT}/libs/zlib/v1.2.11 || exit 1

export CFLAGS_DEPENDENCIES="-I${WASMLABS_OUTPUT_BASE}/zlib/v1.2.11/include ${CFLAGS_DEPENDENCIES}"
export LDFLAGS_DEPENDENCIES="-L${WASMLABS_OUTPUT_BASE}/zlib/v1.2.11/lib ${LDFLAGS_DEPENDENCIES}"
