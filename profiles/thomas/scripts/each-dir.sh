#!/usr/bin/env bash

for DIR in $(find $(pwd) -mindepth 1 -maxdepth 1 -type d -a -not -iname _\* | sort); do
    echo "-----> $(basename ${DIR})"
    pushd ${DIR} >/dev/null
    "$@"
    popd >/dev/null
done
