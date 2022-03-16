Example usage of some of my ansible collections.

### Setup

Install the following tools:

- hcloud cli
- terraform
- ansible

You need ansible>=2.11 for [#67435](https://github.com/ansible/ansible/pull/67435)

Add an SSH Key to your hcloud project:
https://community.hetzner.com/tutorials/add-ssh-key-to-your-hetzner-cloud

Add an API key and setup hcloud-cli
https://github.com/hetznercloud/cli#getting-started

Create a private network in the hcloud console.
Copy terraform.tfvars.example to terraform.tfvars and adjust the variables.
