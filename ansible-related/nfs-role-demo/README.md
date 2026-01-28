# NOTE
# working with git sub-module
git submodule add --force https://github.com/seang454/ansible-nfs-role-itp.git ansible-related/nfs-role-demo/roles/nfs

ansible-galaxy install https://github.com/seang454/ansible-nfs-role-itp.git, main

ansible-galaxy install https://github.com/seang454/ansible-nfs-role-itp.git, main --roles-path .