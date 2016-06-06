#!/bin/bash
set -e
set -u

chmod +x run.sh
cat << EOF
# Run:
cd $(pwd) && ./run.sh
# to build.
EOF

