#!/bin/bash
gcloud container clusters create $1 \
  -z asia-east1-a \
  -m n1-standard-1 \
  --num-nodes 3
