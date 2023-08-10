# deploymentscript
1. Run the command `./install_ansible.sh` in the root folder of this project
2. Update the {{ansible_user}} of your machine in the inventory (Run `whoami` in the terminal to know your username)
3. Run the command `sudo ansible-playbook  cdi/initial_local_deployment.yml` to start the server
4. Once OpenMRS has started run command `ansible-playbook -i inventory/inventory.ini cdi/restart_deployment.yml` to restart sigdep (This is currently necessary due to the changing OpenCR. Do this after updating the correct OpenCR link)