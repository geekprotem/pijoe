
docker run -t --rm \
    -v "$(pwd)"/logs:/var/log/ansible \
    -v "$(pwd)"/ansible:/etc/ansible \
    -v "$(pwd)"/kubeconfig:/tmp/kubeconfig \
    ansible:pijoe ansible-playbook /etc/ansible/playbooks/$@
