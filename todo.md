
enable kubectl from laptop
---
after install, this should work:
```
kubectl --kubeconfig k3s.yaml version
```

finish ssh init role for ansible


create IAM user for cluster
---
    needs keys
AKIASVDVLHTPTB652OZI
vo2+9+Smtr5CLrei7FSGDI+VjsELhLOrsPmOmCuo
    permission to read from ECR *

add IAM creds to cluster

build something to refresh the ECR access every x hours
    in a kubernetes job, perhaps?
    or create the secret needed as part of the deploy process?
        only if images are cached!
    https://github.com/upmc-enterprises/registry-creds


tool to sync public repos to ECR repos
    so i can clone them and pull from a single source
    i can probably use a single repo and tags to separate the upstreams

need helm repo(s)?

things to sync via ^
* kube-dashboard
* argo
* nginx
* python something


