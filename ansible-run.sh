
docker run -it --rm \
    -v "$(pwd)"/logs:/var/log/ansible \
    -v "$(pwd)"/ansible:/etc/ansible \
    ansible:pijoe sh

