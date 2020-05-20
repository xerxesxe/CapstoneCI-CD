#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . -t nginxdemos/hello


# Step 2: 
# List docker images
docker image ls -f label=name=nginxdemos

# Step 3: 
# Run flask app
docker run  -p 80:80 nginxdemos/hello
