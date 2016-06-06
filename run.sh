#!/bin/bash
set -e

MODULE_NAME="{{ skeleton.module_name }}"
DIR="/tmp/shutit_built/{{ skeleton.path }}"
BUILT_DIR="${DIR}/built"
DOMAIN="{{ skeleton.domain }}"
DELIVERY="{{ skeleton.delivery }}"

rm -rf $DIR

shutit skeleton \
	--shutitfile Shutitfile1 \
	--shutitfile Shutitfile2 \
	--module_directory ${DIR} \
	--module_name ${MODULE_NAME} \
	--domain ${DOMAIN} \
	--delivery ${DELIVERY} \
	--template_branch docker

cd $DIR && ./run.sh
