## Benifits in Kubernetes

1. 他用一種語法去抽象不同的平台之間的差異，讓我們可以在 AWS 與 GCP 之間使用相同的設定，
這是 Terraform 所缺乏的地方。

## Pods

- We should always use controllers(e.g., replication controller) instead of using pods directly
- The current best practice for pets is to create a replication controller with `replicas` equal to `1` and a corresponding service

## Label and Label selector

1. Label 合法字元為 `/[a-z0-9A-Z]/`、 `-`、 `_`、 `.`
2. Label selector 可以用逗號分格，扮演 AND logical operator
e.g. `kubectl get pods -l environment=production,tier=frontend`
3. An empty label selector 選取所有 collection 中的物件
4. A null label selector
5.
