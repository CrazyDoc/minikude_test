#!/bin/bash

dtime=$(date +%m%d%y%H%M)

docker build -t date:v$dtime .

kubectl get deployments date-deployment -o yaml | sed 's/\(image: date\):.*$/\1:v'$dtime'/'| kubectl replace -f -