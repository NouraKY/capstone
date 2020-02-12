#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag=nalyahya/capstone .
# Step 2:
# List docker images
docker images ls
# Step 3:
# Run flask app
docker run -p 9000:80 nalyahya/capstone