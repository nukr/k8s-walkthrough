# guestbook with redis and php

## create cluster

```bash
gcloud container clusters create guestbook
gcloud container clusters list
gcloud container clusters describe guestbook
```

## start redis master

```bash
kubectl create -f redis-master-controller.yaml
kubectl get pods
# output more information (such as node name)
kubectl get pods -o wide
```

## start redis service

```bash
kubectl create -f redis-master-service.yaml
kubectl get services -l name=redis-master
```
