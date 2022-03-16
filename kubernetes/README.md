Installs a kubernetes cluster with 2 controller nodes and 2 worker nodes. It also installs an etcd cluster on the controller nodes and haproxy+keepalived as load balancer for the api server.

Initialize and apply terraform

    cd terraform
    terraform init -var-file ../../terraform.tfvars
    terraform apply -var-file ../../terraform.tfvars
    # destroy the setup after
    terraform destroy -var-file ../../terraform.tfvars

Install ansible requirements

    ansible-galaxy install -r requirements.yml
    pip install jmespath

Install haproxy, keepalived and nginx

    # make inventory file
    make.inventory.sh
    # run the playbook
    ansible-playbook install.yml

