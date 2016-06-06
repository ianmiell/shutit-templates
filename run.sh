#!/bin/bash
set -e

MODULE_NAME="{{ skeleton.module_name }}"
DIR="{{ skeleton.skel_path }}/$MODULE_NAME/built"
DOMAIN="{{ skeleton.skel_domain }}"
DELIVERY="{{ skeleton.skel_delivery }}"

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
