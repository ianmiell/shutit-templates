#!/bin/bash
set -e
set -u
chmod +x run.sh
chmod 0400 configs/build.cnf
mv template.py {{ skeleton.module_name }}.py
git init
git submodule init
git submodule add https://github.com/ianmiell/shutit-library

cat << EOF
# Run:
cd $(pwd) && ./run.sh
# to run.
EOF

