#!/bin/bash

export SERVICE_IP=$(kubectl get service $1 -o go-template='{{.spec.clusterIP}}')
export SERVICE_PORT=$(kubectl get service $1 -o go-template='{{(index .spec.ports 0).port}}')
echo "$SERVICE_IP:$SERVICE_PORT"
kubectl run busybox  --generator=run-pod/v1 --image=busybox --restart=Never --tty -i --env "SERVICE_IP=$SERVICE_IP,SERVICE_PORT=$SERVICE_PORT"
