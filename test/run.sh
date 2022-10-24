#!/bin/bash

if [ -z "${RENOVATE_TOKEN}" ]; then
  echo "ERROR: RENOVATE_TOKEN not set"
  exit 1
fi

if [ -z "${RENOVATE_ARGS}" ]; then
  echo "ERROR: RENOVATE_ARGS not set"
  exit 1
fi

PLATFORM="${RENOVATE_PLATFORM:-github}"
LOG_LEVEL="${RENOVATE_LOG_LEVEL:-debug}"

echo "Running on platform ${PLATFORM}"

docker run --rm -it \
  -e LOG_LEVEL="${LOG_LEVEL}" \
  -e RENOVATE_TOKEN="${RENOVATE_TOKEN}" \
  -e GITHUB_COM_TOKEN="${GITHUB_COM_TOKEN}" \
  -v "$(pwd)/${PLATFORM}.js":"/usr/src/app/config.js" \
  docker.io/renovate/renovate ${RENOVATE_ARGS}
