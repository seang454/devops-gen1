## NOTE for working with ansible vault 


```bash 
ansible-vault --help

ansible-vault encrypt filename.yaml 


ansible-playbook .... --ask-vault-pass 
ansible-playbook .... --vault-password-file file.txt 

 ansible-playbook -i inventory.ini playbooks/vault-demo.yaml --vault-password-file secrets/my-secret.txt




```