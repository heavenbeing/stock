#!/bin/sh

dir=$(cd $(dirname $0); pwd)
project_dir=centos
project_name=pythonstock
echo ${dir}

#version=$1
#if [ -z "$version" ]; then
#    echo "version is empty"
#    version=${version}
#fi

NOW_MONTH=$(date "+%Y-%m")

DOCKER_TAG=pythonstock/pythonstock:base-${NOW_MONTH}

echo " docker build -f Dockerfile -t ${DOCKER_TAG} ."
docker build -f Dockerfile -t ${DOCKER_TAG} .
docker save -o ${dir}/../images/pythonstock.tar ${DOCKER_TAG}
echo "#################################################################"
echo " docker push ${DOCKER_TAG} "


