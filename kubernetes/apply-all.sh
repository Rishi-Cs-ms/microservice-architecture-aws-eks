#!/bin/bash

# Exit on error
set -e

echo "Applying Namespaces and Resource Quotas..."
kubectl apply -f ns_rc.yaml

echo "Applying MongoDB StatefulSet and Service..."
kubectl apply -f mongo/

echo "Applying Admin API..."
kubectl apply -f admin-api/

echo "Applying Admin UI..."
kubectl apply -f admin-ui/

echo "Applying User API..."
kubectl apply -f user-api/

echo "Applying User UI..."
kubectl apply -f user-ui/

echo "Applying ALB Ingress..."
kubectl apply -f ingress-alb.yaml

echo "All manifests applied successfully!"
