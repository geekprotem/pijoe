
kubectl get namespaces cert-manager
if [ $? -eq 1 ]
then
  # Install the CustomResourceDefinition resources separately
  kubectl apply --validate=false -f /opt/install_scripts/specs/cert-manager.crds.yaml
  # Create the namespace for cert-manager
  kubectl create namespace cert-manager

  # Add the Jetstack Helm repository
  helm repo add jetstack https://charts.jetstack.io

  # Update your local Helm chart repository cache
  helm repo update

  # Install the cert-manager Helm chart
  helm install \
    cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --version v1.0.4
fi
