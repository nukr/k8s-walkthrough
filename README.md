# k8s-walkthrough

本專案是以 Google Container Engine (a.k.a. GKE)為基礎撰寫的。

這部分請參考 [hello-world](https://github.com/nukr/k8s-walkthrough/tree/master/hello-world)
先從這邊開始，了解一些基礎的 command。

接著就是開始認識一些設定檔案本專案都使用 yaml 格式，k8s 也支援 json 格式，關於 yaml 的用法可以參考
[wiki](https://zh.wikipedia.org/wiki/YAML)

[app](https://github.com/nukr/k8s-walkthrough/tree/master/app)
是一個不錯的開始， 因為我把每個 resource 都寫在一個檔案裡面，你想要分開操作，也可以參考
 [deployments](https://github.com/nukr/k8s-walkthrough/tree/master/deployments)
 [services](https://github.com/nukr/k8s-walkthrough/tree/master/services)
 [pods](https://github.com/nukr/k8s-walkthrough/tree/master/pods)

## Benifits in Kubernetes

1. 他用一種語法去抽象不同的平台之間的差異，讓我們可以在 AWS 與 GCP 之間使用相同的設定，
這是 Terraform 所缺乏的地方。
2. 你不用自行管理 state，你只需要用 scm 管理好你的 config file，state kubernetes
 會幫你處理，這也是 Terraform 所缺乏的。

## Pods

- We should always use controllers(e.g., replication controller) instead of using pods directly.
 The current best practice for pets is to create a replication controller with `replicas` equal to `1` and a corresponding service
- Every Pod has it own IP

## Service

1. targetPort -
2. nodePort -
3. port -

## Label and Label selector

1. Label 合法字元為 `/[a-z0-9A-Z]/`、 `-`、 `_`、 `.`
2. Label selector 可以用逗號分格，扮演 AND logical operator
e.g. `kubectl get pods -l environment=production,tier=frontend`
3. An empty label selector 選取所有 collection 中的物件
4. A null label selector
5. Label 是拿來給 selector 用的，你想要備註一些資訊請用 annotations

## Configuration

可以把多個 resource 集合在一起在一個 yaml 檔案裡面，用 `---` 去分隔不同的 resource。

e.g.
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nginx-svc
  labels:
    app: nginx
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: nginx
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: my-nginx
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```

建立順序是照 yaml 中的順序，由上到下，因此最好指定 service 在前面，因為這樣會確保
排程器（scheduler）可以展開 pods 被 service 結合，就像他是被 controller(s) 建立的
，像是 Deployment（？）

## Apply Replace Edit Patch

1. kubectl apply 會做一個 3 way diff(previous current next)
2. 會加上一個 annotation to the resource

## Autoscaling

- KUBE_ENABLE_CLUSTER_AUTOSCALER=true
- KUBE_AUTOSCALING_MIN_NODES=1
- KUBE_AUTOSCALING_MAX_NODES=10

```bash
# create
gcloud container cluster create mytestcluster --zone=asia-east1-a --enable-autoscaling=true --min-nodes=1 --max-nodes=10 --num-nodes=5

# update
gcloud container clusters update my_test_cluster --enable-autoscaling=ture --min-nodes=1 --max-nodes=15
```

## Glossary

- multi-tier application: frontend backend database 這樣的架構就是 multi-tier

## Resource

- 推測是用 docker runtime constraints on resource 去限制記憶體以及 cpu 用量

## Replica Set vs Replication Controller vs Deployments

### Replica Set

> we recommend using Deployments instead of directly using Replica Sets, unless you require custom update orchestration or don’t require updates at all.

### Replication Controllers

### Deployments

## Pet Set

## Examples

### Rethinkdb

## Secrets

```bash
kubectl create secret generic gcs-credential --from-file=/credentials/gcs.json
```

## Q&A
How to `kubectl` switch cluster ?

`kubectl config use-context <context-name>`
