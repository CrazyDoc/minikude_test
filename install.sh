#!/bin/bash

docker build -t date:v1 .

kubectl apply -f date-deployment.yaml

kubectl apply -f date-service.yaml