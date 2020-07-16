#!/bin/bash

dtime=$(date +%m%d%y%H%M)

docker build -t date:v$dtime .

kubectl get deployments date-deployment -o yaml | sed 's/\(image: date\):.*$/\1:v'$dtime'/'| kubectl replace -f -

if curl -Is $(minikube service date-service --url) | head -1 | grep -q 'HTTP/1.1 200 OK'; then echo 'up'; else kubectl rollout undo deployment/date-deployment; fi