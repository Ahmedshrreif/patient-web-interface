#!/bin/bash

# Deploy to Minikube script

echo "Starting deployment to Minikube..."

# Apply Kubernetes manifests
kubectl apply -f kubernetes/deployment.yml
kubectl apply -f kubernetes/service.yml

# Wait for deployment to be ready
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/patient-web-interface-deployment

# Get deployment status
echo "Deployment status:"
kubectl get deployments
kubectl get pods
kubectl get services

echo "Deployment completed!"
echo "To access the application, run:"
echo "kubectl port-forward service/patient-web-interface-service 8080:80"

