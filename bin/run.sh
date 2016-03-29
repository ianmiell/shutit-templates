#!/bin/bash
# Example for running
DOCKER=${DOCKER:-docker}
IMAGE_NAME=%s
CONTAINER_NAME=$IMAGE_NAME
DOCKER_ARGS=''
while getopts "i:c:a:" opt
do
    case "$opt" in
    i)
        IMAGE_NAME=$OPTARG
        ;;
    c)
        CONTAINER_NAME=$OPTARG
        ;;
    a)
        DOCKER_ARGS=$OPTARG
        ;;
    esac
done
${DOCKER} run -d --name ${CONTAINER_NAME} {{ skeleton.module_name }} {{ skeleton.ports_arg }} {{ skeleton.volumes_arg }} {{ skeleton.env_arg }} ${DOCKER_ARGS} ${IMAGE_NAME} {{ dockerfile.entrypoint }} {{ dockerfile.cmd }}

