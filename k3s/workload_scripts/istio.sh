
kubectl create namespace istio-system

# need to do this for _every_ namespace where istio needs to route
kubectl label namespace default istio-injection=enabled
