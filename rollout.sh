if curl -Is $(minikube service date-service --url) | head -1 | grep -q 'HTTP/1.1 200 OK'; then echo 'up'; else kubectl rollout undo deployment/date-deployment; fi