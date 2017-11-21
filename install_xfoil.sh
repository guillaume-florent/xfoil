#!/usr/bin/env bash

# File
#     install_xfoil.sh
#
# Description
#     this script will
#     1) Build the xfoil:6.99 Docker image
#     2) Create a container with the name xfoil
#
#     Note: Docker daemon should be running before  launching script


username="$USER"
user="$(id -u)"
home="${1:-$HOME}"

imageName="guillaume-florent/xfoil:6.99"
containerName="xfoil"
displayVar="$DISPLAY"

echo "*******************************************************"
echo ""
echo "Building Docker XFoil container ${containerName}"

docker build --tag ${imageName} .

docker run  -it -d --name ${containerName} --user=${user}   \
    -e USER=${username}                                     \
    -e DISPLAY=${displayVar}                                \
    --workdir="${home}"                                     \
    --volume="${home}:${home}"                              \
    --volume="/etc/group:/etc/group:ro"                     \
    --volume="/etc/passwd:/etc/passwd:ro"                   \
    --volume="/etc/shadow:/etc/shadow:ro"                   \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro"             \
     -v=/tmp/.X11-unix:/tmp/.X11-unix ${imageName}          \
     /bin/bash


echo "Container ${containerName} was created."

echo "*******************************************************"
echo "Run the ./start_xfoil.sh script to launch container"
echo "*******************************************************"