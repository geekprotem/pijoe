
docker run -it --rm \
    -v "$(pwd)"/kubeconfig/k3s.yaml:/root/.kube/config:ro \
    -v "$(pwd)"/specs:/opt/specs \
    kubectl:pijoe bash
