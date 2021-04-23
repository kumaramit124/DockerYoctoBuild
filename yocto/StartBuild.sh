#!/bin/bash

WORKDIR="$(pwd)"

sed -i "s|^WORKDIR=.*$|WORKDIR=\"${WORKDIR}\"|" ./yocto-entrypoint.sh

docker run -i -t --rm \
            -v ${WORKDIR}:${WORKDIR} \
            -v $(pwd)/yocto-entrypoint.sh:/yocto-entrypoint.sh \
            yocto-compile:latest \
            yocto $@
