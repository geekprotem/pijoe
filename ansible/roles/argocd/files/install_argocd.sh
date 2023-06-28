
kubectl get namespaces argocd
if [ $? -eq 1 ]
then
    # Create the namespace
    kubectl create namespace argocd
    kubectl apply -n argocd -f /opt/install_scripts/specs/argocd.yaml
fi
