#!/bin/bash
#set -e
#set -u

chmod +x run.sh
cat > README.md << EOF
# Run:
cd $(pwd) && ./run.sh
# to build.
# Or
# cd $(pwd) && ./run.sh -c
# to run while choosing modules to build.
EOF
cat README.md
