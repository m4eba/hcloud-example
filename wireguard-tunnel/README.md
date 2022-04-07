Example setup of a wireguard tunnel between a local network and a hcloud network. 

Initialize and apply terraform

    cd terraform
    terraform init -var-file ../../terraform.tfvars
    terraform apply -var-file ../../terraform.tfvars
    # destroy the setup after
    terraform destroy -var-file ../../terraform.tfvars

Install ansible requirements

    ansible-galaxy install -r requirements.yml
    

Install wireguard and ufw

    # make inventory file
    make.inventory.sh
    # run the playbook
    ansible-playbook install.yml
    # setup the firewall
    ansible-playbook ufw_hcloud.yaml
    ansible-playbook ufw_local.yaml

