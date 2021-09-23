# What is Crossplane 
1. Crossplane is an open source Kubernetes add-on that enables platform teams to assemble infrastructure from multiple vendors.
2. Expose higher level self-service APIs for application teams to consume, without having to write any code.
3. Provisioned and managed by kubectl, GitOps, or any tools that can talk with the Kubernetes API.

# Prerequisites
For macOS / Linux / Windows use the following:
- Kubernetes cluster
    - Kind
    - Minikube, minimum version v0.28+
    - etc.
- Helm, minimum version v3.0.0+.

# Installing Crossplane

1. Create namespace.
```
kubectl create namespace crossplane-system
```
2. Add Helm Chart.
```
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
```
3. Install crossplane using helm.
```
helm install crossplane --namespace crossplane-system crossplane-stable/crossplane
```
4. Check the status.
```
helm list -n crossplane-system
kubectl get all -n crossplane-system
``` 
# Install Crossplane CLI

1. Install Crossplane CLI using script.
```
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
```
# Install Provider

1. Install GCP provider version 0.18.0 (latest)  using crossplane CLI.
```
kubectl crossplane install provider crossplane/provider-gcp:v0.18.0
```
2. Check the status.
```
kubectl get pkg
```
> NOTE: Wait until it becomes healthy

# Get GCP Account Keyfile

1. Run the script.
```
./gcp-sa-script.sh
```
> Note: Change the ***PROJECT_ID*** and ***SA_NAME*** according to usage 

# Create a Provider Secret

1. Use the following command to create kubernetes secret from service account JSON file. 
```
kubectl create secret generic gcp-creds -n crossplane-system --from-file=creds=./creds.json
```
# Configure the Provider

1. We will create the ProviderConfig object to configure credentials for GCP Provider.
2. Run the provider.sh script
```
./provider.sh
```
> Note: Change the ***PROJECT_ID*** according to usage

# Provision Infrastructure

1. Create GKE Cluster
```
kubectl apply -f gke.yaml
```

# LINKS:

1. Crossplane official Document: https://crossplane.io/
