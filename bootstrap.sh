#!/bin/zsh

# task=$1

# domain='pinet'
# master_node='pijoe0'
# worker_nodes=(
#     pijoe1
#     pijoe2
#     pijoe3
#     pijoe4
#     pijoe5
# )
# kubectl="kubectl --kubeconfig ~/.kube/config"


# function install {
    # get_installer
    # run_on_master 'sh k3s.install.sh --write-kubeconfig-mode 644'
    # sleep 10
    # run_on_master 'kubectl version'
    # token=$(run_on_master 'sudo cat /var/lib/rancher/k3s/server/node-token')
    # echo ${token}
    # run_on_workers "K3S_URL=https://${master_node}.${domain}:6443 K3S_TOKEN=${token} sh k3s.install.sh"
    # sleep 30
    # run_on_master 'kubectl get nodes'
    # configure
    # install_tools
# }


# function init {
#     # set_hostnames
#     # run_on_all 'sudo apt-get update'
#     # run_on_app 'sudo apt-get install curl nmap telnet'
#     # run_on_all 'sudo apt-get upgrade -y'
#     # run_on_all 'sudo reboot'
#     # sleep 30
# }


function install_tools {
    # curl -fsSL -o tool_scripts/get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    # run_on_master 'mkdir -p tool_scripts'
    # scp -r tool_scripts/* ${master_node}:tool_scripts/
    # run_on_master 'chmod +700 tool_scripts/get_helm.sh'
    # run_on_master './tool_scripts/get_helm.sh'
    # run_on_master 'helm version'
    # install cert-manager
    # run_on_master 'sh tool_scripts/install_cert-manager.sh'
    # sleep 30
    # install rancher
    run_on_master 'sh tool_scripts/install_rancher.sh'
    open https://rancher.pinet
}


# function configure {
#     scp ${master_node}:/etc/rancher/k3s/k3s.yaml kubeconfig/k3s.yaml
#     sed -i.bak "s/127.0.0.1/${master_node}.${domain}/g" kubeconfig/k3s.yaml
#     assign_roles
# }


# function uninstall {
#     run_on_workers 'k3s-uninstall.sh > /dev/null'
#     run_on_master 'k3s-uninstall.sh > /dev/null'
# }


# function get_installer {
#     echo 'downloading installer...'
#     curl -sfL https://get.k3s.io > k3s.install.sh
#     echo 'distributing to hosts...'
#     scp k3s.install.sh ${master_node}:k3s.install.sh
#     for worker_node in "${worker_nodes[@]}"
#     do
#         scp k3s.install.sh ${worker_node}:k3s.install.sh
#     done
# }


# function run_on_all() {
#     run_on_master $@
#     run_on_workers $@
# }


# function run_on_master() {
#     # command=$1
#     # echo "master: ${command}"
#     output=$(ssh ${master_node} "$@")
#     echo ${output}
# }


# function set_hostnames() {
#     run_on_master "sudo hostname ${master_node}.pinet"
#     run_on_master "sudo sed s/raspberrypi/${master_node}/g -i /etc/hosts"
#     run_on_master "sudo sed s/raspberrypi/${master_node}/g -i /etc/hostname"
#     for worker_node in "${worker_nodes[@]}"
#     do
#         ssh ${worker_node} "sudo hostname ${worker_node}.pinet"
#         ssh ${worker_node} "sudo sed s/raspberrypi/${worker_node}/g -i /etc/hosts"
#         ssh ${worker_node} "sudo sed s/raspberrypi/${worker_node}/g -i /etc/hostname"
#     done
# }


# function assign_roles() {
#     for worker_node in "${worker_nodes[@]}"
#     do
#         kubectl --kubeconfig k3s.yaml label --overwrite node ${worker_node}.${domain} name=${worker_node}
#         kubectl --kubeconfig k3s.yaml label --overwrite node ${worker_node}.${domain} node-role.kubernetes.io/${worker_node}=${worker_node}
#         kubectl --kubeconfig k3s.yaml label --overwrite node ${worker_node}.${domain} node-role.kubernetes.io/worker=worker
#     done
# }


# function run_on_workers() {
#     # command=$1
#     for worker_node in "${worker_nodes[@]}"
#     do
#         # echo ${worker_node} ...
#         # echo "worker(${worker_node}): ${command}"
#         ssh ${worker_node} "$@"
#     done
# }



# if [ "${task}" = "init" ]
# then
#     init
# elif [ "${task}" = "install" ]
# then
#     install
# elif [ "${task}" = "configure" ]
# then
#     configure
# elif [ "${task}" = "install_tools" ]
# then
#     install_tools
# elif [ "${task}" = "uninstall" ]
# then
#     uninstall
# elif [ "${task}" = "status" ]
# then
#     run_on_master 'kubectl version ; kubectl get nodes'
# elif [ "${task}" = "sshinit" ]
# then
#     ssh-copy-id -i ~/.ssh/pijoe.pub pi@${master_node}.${domain}
#     for worker_node in "${worker_nodes[@]}"
#     do
#         ssh-copy-id -i ~/.ssh/pijoe.pub pi@${worker_node}.${domain}
#     done
# fi


# echo "done"
