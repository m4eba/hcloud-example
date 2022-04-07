Installs a 3 node etcd and 3 node patroni cluster with haproxy and keepalived.

Initialize and apply terraform

    cd terraform
    terraform init -var-file ../../terraform.tfvars
    terraform apply -var-file ../../terraform.tfvars
    # destroy the setup after
    terraform destroy -var-file ../../terraform.tfvars

Install ansible requirements

    ansible-galaxy install -r requirements.yml
    pip install jmespath

Install etcd, patroni haproxy and keepalived

    # make inventory file
    make.inventory.sh
    # run the playbook
    ansible-playbook install.yml

