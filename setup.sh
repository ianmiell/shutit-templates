#!/bin/bash
chmod +x run.sh
chmod 0400 configs/build.cnf
mv template.py {{ skeleton.module_name }}.py

echo << EOF
================================================================================
Run:

    cd $(pwd) && ./run.sh

to run.
================================================================================
EOF

