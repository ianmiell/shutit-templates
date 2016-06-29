#!/bin/bash
set -e
set -u
chmod +x images.sh
chmod +x run.sh
chmod 0400 configs/build.cnf
mv template.py {{ skeleton.module_name }}.py


cat << EOF
cd $(pwd)
# 
# 1) Edit the Dockerfile to reflect the stages of the build.
# 
# 2) Edit the images.sh file to set the image name.
# 
# 3) Edit the configs/build.cnf to specify the relevant images that are allowed
# (eg '.*') and the starting one.
# 
# 4) Edit the {{ skeleton.module_name }}.py file and add challenges etc.
# 
# 5) Run
# 
# ./images.sh # to build and push the image to dockerhub
#
# 6) Run
# 
# ./run.sh    # to run the tutorial
# 
# An example tutorial is here: https://github.com/ianmiell/git-bisect-tutorial
EOF

