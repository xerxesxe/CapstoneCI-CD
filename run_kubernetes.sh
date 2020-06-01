#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=bulletinboard:1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-project2 --image=bulletinboard:1.0

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
echo "sleeping for 10 seconds while waiting for pod to come up"
sleep 10
kubectl port-forward deployment/udacity-microservice 8080:80
kubectl logs --selector app=udacity-microservice


kubectl run udacity-project --image=994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest --requests=cpu=500m --expose --port=3000
