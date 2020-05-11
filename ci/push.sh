#!/usr/bin/env bash

cd $(dirname $0)
cd ../

export AWS_DEFAULT_REGION=us-east-2
printenv

echo "Push image to $IMAGE_URL"

# Tag image
docker tag everfit-demo-frontend:latest $IMAGE_URL

# Push image
docker push $IMAGE_URL
