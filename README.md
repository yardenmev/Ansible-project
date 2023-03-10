# Ansible Terraform exercise

1. Terraform - Provision network and compute infrastructure:
   - VPC
   - 2 Subnets
   - 3 EC2 instances
   - Security group:
     - Inbound HTTP from anywhere.
     - Inbound SSH from your IP.
     - Anything inbound if its source is **from within** the VPC.
2. Setup servers:
   - One of the EC2 instances will act as the Ansible _Control Node_. Install Ansible on it (using `user_data`).
   - The other two instances will act as the _Managed Nodes_ (Hosts). You'll need to expose them with a public IP and make sure the Control node has the required access to them.

3. Ansible - Write your own:
   - Static _inventory file_ with the IP adresses of the two Managed Nodes.
   - Ansible configuration file (ansible.cfg)
   - Playbook that deploys this webpage - https://raw.githubusercontent.com/MathoAvito/Ansible-Exercise/main/Ansible/Webfile/index.html
       Note: you'll need to install and start an HTTP server!

4. Check:
   - Connect to the Ansible Control Node
   - Run the Playbook
   - Open the public IP adresses of the instances and check if you can see the website
