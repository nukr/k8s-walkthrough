#!/bin/bash
gcloud container clusters create $1 \
  -z asia-east1-a \
  -m n1-standard-1 \
  --enable-autoscaling \
  --network=gke \
  --subnetwork=gke \
  --min-nodes=3 \
  --max-nodes=10 \
  --num-nodes 3
