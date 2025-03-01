#!/bin/bash
# Kubernetes Pod Auto-Restart Script

NAMESPACE="default"

# Get pods in CrashLoopBackOff
PODS=$(kubectl get pods -n $NAMESPACE | grep 'CrashLoopBackOff' | awk '{print $1}')

if [[ -n "$PODS" ]]; then
    echo "Restarting failed pods..."
    for POD in $PODS; do
        kubectl delete pod $POD -n $NAMESPACE
        echo "Restarted: $POD"
    done
else
    echo "✅ No crashed pods found"
fi

