#!/bin/bash
set -e
set -u
chmod +x images.sh
chmod +x run.sh
chmod 0400 configs/build.cnf
mv template.py {{ skeleton.module_name }}.py


cat << EOF
================================================================================
Edit the Dockerfile to reflect the stages of the build.

Edit the images.sh file to set the image name.

Then edit the {{ skeleton.module_name }}.py file and add challenges etc.

And then:

	./images.sh # to build and push the image to dockerhub
	./run.sh    # to run the tutorial

An example is: https://github.com/ianmiell/git-bisect-tutorial
================================================================================
EOF

