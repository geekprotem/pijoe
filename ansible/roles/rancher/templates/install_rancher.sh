
kubectl get namespaces cattle-system
if [ $? -eq 1 ]
then
  helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
  helm repo update
  kubectl create namespace cattle-system

  helm install rancher rancher-latest/rancher \
    --namespace cattle-system \
    --set hostname={{ rancher.host }} \
    --set replicas=1 \
    --set rancherImageTag={{ rancher.tag }}

fi
