#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=zoidzter/api

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username=zoidzter
IMAGEID=`docker images --format='{{.ID}}' | head -1`
tagName=":latest"
docker tag $IMAGEID $dockerpath$tagName

# Step 3:
# Push image to a docker repository
docker push zoidzter/api:latest