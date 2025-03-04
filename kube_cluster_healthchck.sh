#!/bin/bash
echo "Checking Kubernetes cluster health..."

kubectl get pods --all-namespaces | awk '$4!="Running" {print $2, $4}'

# Restart any crashed pods
for pod in $(kubectl get pods --all-namespaces | awk '$4!="Running" {print $2}'); do
    kubectl delete pod "$pod" --force --grace-period=0
done

