#!/bin/bash
docker rmi "okw/frontend"
docker build -t "okw/frontend" .
