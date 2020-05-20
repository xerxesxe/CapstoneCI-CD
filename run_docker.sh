#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . -t xerxesxe/udacity_project5:1.0


# Step 2: 
# List docker images
docker image ls -f label=name=udacity_project5

# Step 3: 
# Run flask app
docker run  -p 5000:5000 xerxesxe/udacity_project5:1.0
