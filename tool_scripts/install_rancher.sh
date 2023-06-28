export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
kubectl create namespace cattle-system

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=rancher.pinet \
  --set replicas=1 \
  --set rancherImageTag=v2.4-head-linux-arm64


sleep 5
kubectl -n cattle-system rollout status deploy/rancher
