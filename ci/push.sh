#!/usr/bin/env bash

cd $(dirname $0)
cd ../

# Tag image with newest version
docker tag everfit-demo-frontend:latest "$IMAGE_URL_WITHOUT_VER:latest"

# Push latest image
docker push "$IMAGE_URL_WITHOUT_VER:latest"

# Tag image with specfic version
docker tag everfit-demo-frontend:latest "$IMAGE_URL_WITHOUT_VER:2"

# Push image with specfic version
docker push "$IMAGE_URL_WITHOUT_VER:2"
