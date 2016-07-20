# secured server

##

```bash
kubectl create -f secured-server.yaml
kubectl create -f service.yaml

# firewall rules
gcloud compute firewall-rules create allow-monolith-nodeport --allow=tcp:31000
```
