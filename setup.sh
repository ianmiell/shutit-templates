#!/bin/bash
set -e
set -u

chmod +x run.sh
cat << EOF
# Run:
cd $(pwd) && ./compile.sh
# to build.
# Or
# cd $(pwd) && ./compile.sh -c
# to run while choosing modules to build.
EOF

