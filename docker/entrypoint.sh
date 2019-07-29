#!/bin/bash
cd  /home/container

# Replace Startup Variables
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
