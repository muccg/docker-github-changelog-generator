#!/bin/sh
#
# Script to build images
#

: ${PROJECT_NAME:='github-changelog-generator'}
. ./lib.sh

set -e

docker_options

info "${DOCKER_BUILD_OPTS}"

image="${DOCKER_IMAGE}"
echo "################################################################### ${image}"

## warm up cache for CI
docker pull ${image} || true

## build
set -x
docker-compose build

## for logging in CI
docker inspect ${image}

if [ ${DOCKER_USE_HUB} = "1" ]; then
    _ci_docker_login
    docker push ${image}
fi
set +x
