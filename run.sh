#!/bin/bash
set -e

MODULE_NAME="{{ skeleton.module_name }}"
DIR="/tmp/shutit_built/{{ skeleton.path }}"
BUILT_DIR="${DIR}/built"
DOMAIN="{{ skeleton.domain }}"
DELIVERY="{{ skeleton.delivery }}"
TEMPLATE_BRANCH="{{ skeleton.template_branch }}"
TEMPLATE_BRANCH="bash"

rm -rf $DIR

shutit skeleton \
	--shutitfile Shutitfile1 Shutitfile2 \
	--name ${DIR} \
	--domain ${DOMAIN} \
	--delivery ${DELIVERY} \
	--template_branch ${TEMPLATE_BRANCH}

if [[ ${DELIVERY} == 'bash' ]]
then
	cd $DIR && ./run.sh "$@"
elif [[ ${DELIVERY} == 'docker' ]]
then
	cd $DIR/bin && ./build.sh "$@"
fi
