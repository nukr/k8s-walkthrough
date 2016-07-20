# hello-world

## create infra

```bash
./create_cluster.sh hello-world
```

## get credentials
```bash
gcloud container clusters get-credentials hello-world
```

## create pods
```bash
kubectl run hello-node \
  --image=asia.gcr.io/instant-matter-765/httpbin:latest \
  --port=8000
```

## get info

```bash
kubectl get deployments
kubectl get pods
kubectl logs <POD-NAME>

kubectl cluster-info
kubectl get events
kubectl config view
```

## allow external

```bash
kubectl expose deployment hello-node --type="LoadBalancer"
kubectl get services hello-node
curl http://EXTERNAL_IP:8000
```

## scale up

```bash
kubectl scale depoyment hello-node --replicas=4
kubectl get deployment
kubectl get pods
```

## update

```bash
kubectl edit deployment hello-node
# deployment "hello-node" edited

kubectl get deployments

```
## delete all of them
```bash
kubectl delete service,deployment hello-node
gcloud container clusters delete hello-world
```
