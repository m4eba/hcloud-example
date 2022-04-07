Creates a wireguard tunnel between your local network and a hcloud network.

Initialize and apply terraform

    cd terraform
    terraform init -var-file ../../terraform.tfvars
    terraform apply -var-file ../../terraform.tfvars
    # destroy the setup after
    terraform destroy -var-file ../../terraform.tfvars

Install ansible requirements

    ansible-galaxy install -r requirements.yml
    
Config the settings of your local network

Install wireguard and make the routes

    # make inventory file
    make.inventory.sh
    # run the playbook
    ansible-playbook install.yml

