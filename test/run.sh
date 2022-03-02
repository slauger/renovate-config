#!/bin/bash

if [ -z "${RENOVATE_TOKEN}" ]; then
  echo "ERROR: RENOVATE_TOKEN not set"
  exit 1
fi

if [ -z "${RENOVATE_ARGS}" ]; then
  echo "ERROR: RENOVATE_ARGS not set"
  exit 1
fi

echo "Running on platform ${PLATFORM:-github}"

docker run --rm -it \
  -e LOG_LEVEL="${RENOVATE_LOG_LEVEL:-debug}" \
  -e RENOVATE_TOKEN="${RENOVATE_TOKEN}" \
  -v $(pwd)/${PLATFORM:-github}.js:/usr/src/app/config.js \
  docker.io/renovate/renovate ${RENOVATE_ARGS}
