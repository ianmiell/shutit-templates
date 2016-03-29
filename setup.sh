#!/bin/bash
chmod +x bin/build.sh
chmod +x bin/test.sh
chmod +x bin/run.sh
chmod 0400 config/build.cnf
chmod 0400 config/push.cnf
mv template.py {{ skeleton.module_name }}.py


echo << EOF
================================================================================
Run:

    cd $(pwd)/bin && ./build.sh

to build.

And then:

	./run.sh

to run.
================================================================================
EOF

