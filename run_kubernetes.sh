#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=xerxesxe/udacity_project5:1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-project --image=xerxesxe/udacity_project5:1.0 --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
echo "sleeping for 10 seconds while waiting for pod to come up"
sleep 10
kubectl port-forward deployment/udacity-microservice 5000:5000
kubectl logs --selector app=udacity-microservice



