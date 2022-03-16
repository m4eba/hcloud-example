Installs haproxy with keepalived on 2 servers and nginx on 2 servers.

Initialize and apply terraform

    cd terraform
    terraform init -var-file ../../terraform.tfvars
    terraform apply -var-file ../../terraform.tfvars
    # destroy the setup after
    terraform destroy -var-file ../../terraform.tfvars

Install ansible requirements

    ansible-galaxy install -r requirements.yml

Install haproxy, keepalived and nginx

    # make inventory file
    make.inventory.sh
    # run the playbook
    ansible-playbook install.yml


Testing the load balancer:

    # login
    hcloud server ssh haproxy-4vps-nginx-1
    # curl the load balancer ip
    # the output should change between 'nginx1' and 'nginx2'
    curl 10.0.1.1
