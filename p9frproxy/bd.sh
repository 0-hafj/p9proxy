#!/bin/bash

## requires 'az account set' to correct subs

build() {
  echo "Building image..."
  docker build -t tlodevacr.azurecr.io/p9frproxy:latest .
}

push() {
  echo "Building image and pushing it to repository..."
  az acr login -n tlodevacr
  docker push tlodevacr.azurecr.io/p9frproxy:latest
}

test() {
  echo "Building image and running image on docker locally..."
  docker build -t tlodevacr.azurecr.io/p9frproxy:local .
  docker stop p9frproxy
  docker run -d --rm --name p9frproxy -p 4000:4000 -e HTTP_PROXY="http://localhost:3128" -e HTTPS_PROXY="http://localhost:3128" -e NO_PROXY=".sfso.no, .dfo.no" tlodevacr.azurecr.io/p9frproxy:local
}

while [ "$#" -gt 0 ]; do
  case $1 in
    --build)
      BUILD=true
      ;;
    --push)
      PUSH=true
      ;;
    --test)
      TEST=true
      ;;      
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
  shift
done

if [ "$BUILD" = true ]; then
  build
fi

if [ "$PUSH" = true ]; then
  build
  push
fi

if [ "$TEST" = true ]; then
  test
fi
