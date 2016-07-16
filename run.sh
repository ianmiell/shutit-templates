#!/bin/bash
set -e

MODULE_NAME="{{ skeleton.module_name }}"
DIR="/tmp/shutit_built/{{ skeleton.path }}"
BUILT_DIR="${DIR}/built"
DOMAIN="{{ skeleton.domain }}"
DELIVERY="{{ skeleton.delivery }}"
DELIVERY="bash"

rm -rf $DIR

shutit skeleton \
	--shutitfile Shutitfile1 Shutitfile2 \
	--name ${DIR} \
	--domain ${DOMAIN} \
	--delivery ${DELIVERY} \
	--template_branch ${DELIVERY}

if [[ ${DELIVERY} == 'bash' ]]
then
	cd $DIR && ./run.sh "$@"
elif [[ ${DELIVERY} == 'docker' ]]
then
	cd $DIR/bin && ./build.sh "$@"
fi
