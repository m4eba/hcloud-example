Installs a 3 server keepalived setup in a private hcloud network.

Initialize and apply terraform

    cd terraform
    terraform init -var-file ../../terraform.tfvars
    terraform apply -var-file ../../terraform.tfvars
    # destroy the setup after
    terraform destroy -var-file ../../terraform.tfvars

Install ansible requirements

    ansible-galaxy install -r requirements.yml

Install keepalived

    # make inventory file
    make.inventory.sh
    # install keepalived
    ansible-playbook install.yml

The notify script will log the state changes to `/tmp/keepalived_log.txt`
Simulating a delay:

    # watch the keepalived service on all nodes to see setup changes
    journalctl -f -u keepalived.service
    # add delay on the master node (adjust the interface name)
    tc qdisc add dev enp7s0 root netem delay 10000ms
    # remove delay
    tc qdisc delete dev enp7s0 root
