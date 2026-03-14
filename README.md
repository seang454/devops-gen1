# This will populate all 3 submodule folders:
    ansible-related/nfs-role-demo/roles/nfs
    kubespray
    kubernetes/ingress-lessons/dns

git submodule update --init --recursive

# Step 1 — clone the main repo
git clone <your-repo-url>

# Step 2 — go into it
cd <repo-name>

# Step 3 — pull all submodules
git submodule update --init --recursive