#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=xerxesxe/bulletinboard:1.0

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

export DOCKER_ID_USER="xerxesxe"
docker login
docker tag bulletinboard:1.0 $DOCKER_ID_USER/bulletinboard:1.0
docker push $DOCKER_ID_USER/bulletinboard:1.0
# Step 3:
# Push image to a docker repository