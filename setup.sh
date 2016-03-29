#!/bin/bash
chmod +x bin/build.sh
chmod +x bin/test.sh
chmod +x bin/run.sh
chmod 0400 configs/build.cnf
chmod 0400 configs/push.cnf
mv template.py {{ skeleton.module_name }}.py


cat << EOF
================================================================================
Run:

    cd $(pwd)/bin && ./build.sh

to build.

And then:

	./run.sh

to run.
================================================================================
EOF

