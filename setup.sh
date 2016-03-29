#!/bin/bash
chmod +x run.sh
chmod 0400 configs/build.cnf
mv template.py {{ skeleton.module_name }}.py
git clone https://github.com/ianmiell/shutit-library
rm -rf shutit-library/.git

cat << EOF
================================================================================
Run:

    cd $(pwd) && ./run.sh

to run.
================================================================================
EOF

