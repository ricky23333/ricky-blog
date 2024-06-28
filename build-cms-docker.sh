#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Please provide cms image version. For example 0.1.1.20240331"
    exit 1
fi

IMAGE_TAG=$1

docker build --platform linux/amd64 -t ricky_blog_cms:$IMAGE_TAG -f deployment/dockers/cms.Dockerfile . 
echo "Please check docker image ricky_blog_cms:$IMAGE_TAG"