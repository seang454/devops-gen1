# NOTE
# working with git sub-module, this is used to add submodual 
git submodule add --force https://github.com/seang454/ansible-nfs-role-itp.git ansible-related/nfs-role-demo/roles/nfs

ansible-galaxy install git+https://github.com/seang454/ansible-nfs-role-itp.git,main

# this command is used to install role from git sub-module
ansible-galaxy install git+https://github.com/seang454/ansible-nfs-role-itp.git,main --roles-path .