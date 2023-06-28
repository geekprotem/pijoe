
network setup
---
choose an IP for each host
add a local A record for each host, like
* pinet0.pinet -> 1.2.3.4
add a local CNAME record for
* rancher.pinet -> pinet0.pinet (any host should do, really)


get image
---
arm64 raspbian can be found here:
https://downloads.raspberrypi.org/raspios_lite_arm64/images/
download the .zip you need

modify image
---
* unzip image
* mount .img file
```
touch /Volumes/boot/ssh
```
append `cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory` to cmdline.txt

* unmount image

write image
---
using the `raspberry pi imager`, write the image to the SD card(s)
this will be a custom/local image - not one in the menu

make a new ssh key
---
pijoe.pub


edit boostrap.sh
---
make sure the master node hostname is set, along with all the workers


ssh init
---
this will install the ssh key to all targets
```
sh bootstrap.sh sshinit
```


init
---
this will set hostnames and do some updates, followed by a reboot
```
sh bootstrap.sh init
```




argo setup
---
argocd should be setup via the ansible cluster playbook
once all the pods are running, it will be accessible via port 30080
you'll need to get the admin user's password via
```
kubectl -n argocd get secrets argocd-initial-admin-secret -o jsonpath='{.dat
a.password}'|base64 -d
```
(note that you ignore any non-alphanumeric characters at the end)

you'll also need to generate a github key to use for linking

