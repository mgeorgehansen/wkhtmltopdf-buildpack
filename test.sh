#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run \
    -it \
    -v "$DIR:/app/buildpack:ro" \
    heroku/buildpack-testrunner
