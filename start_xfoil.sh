#!/usr/bin/env bash

# File
#     start_xfoil.sh
#
# Description
#      This script will
#          1) Start the xfoil container with name 'xfoil'
#             in the the shell terminal.
#      Note
#          1) User should run xhost+ from other terminal
#          2) Docker daemon should be running before launching this script
#
#------------------------------------------------------------------------------

xhost +local:xfoil
docker start xfoil
docker exec -it xfoil /bin/bash