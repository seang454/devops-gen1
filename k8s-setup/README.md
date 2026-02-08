- requirements.txt lists all the Python packages (libraries) your project depends on, along with their versions if needed.
- Ensures that anyone else (or your deployment environment) can install the exact packages your project needs.
- Makes your project reproducible.
- pip install -r requirements.txt


1. Edite the inventory file for our insfratruture for access details in here
/kubespray/inventory/sameple/inventory.ini

2. Define what need to installed inside our cluster
kubespray/inventory/sameple/group_vars/k8s_cluster/addson.yaml
- k8s-dashboard : true
- helm: true
- agrocd: true
- metric_server: true
- certmanager: true
- nginx-ingress-controller: true
3. confix name in 
kubespray/inventory/sameple/group_vars/k8s_cluster/k8s-cluster.yaml

4. run cluster.yaml playbook
```bash 
ansible-playbook -b -v -i inventory/sameple/inventory.ini cluster.yaml
# after success full installation
kubectl get node
kubectl get node -o wide
kubectl get pode -A
```

5. Note if running playbook have error we have to using reset yaml file provided from kubespray
```bash
ansible-playbook -b -v -i inventory/sameple/inventory.ini reset.yaml
```

6. Type kubectl without sudo 
```bash
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

```bash
kubectl -n kube-system create secret generic k8s-ccm-key \
  --from-file=cloud-sa.json=./k8s-ccm-key.json
```
- What it does
    - Creates a Kubernetes Secret in the kube-system namespace.
    - Name of the secret: k8s-ccm-key
    - Secret contains the GCP service account JSON key (k8s-ccm-key.json)
    - Inside the secret, the key will appear as cloud-sa.json (this is what your pod expects via GOOGLE_APPLICATION_CREDENTIALS=/etc/gcp/cloud-sa.json)
```bash
kubectl get secret -n kube-system
kubectl get secret k8s-ccm-key -n kube-system -o yaml
```
- to verify the secrete we created

```bash
kubectl -n kubernetes-dashboard create token dashboard-admin
```
this command is used to get token for kubernente dashboard

```bash
ab -n 1000 -c 1000 url
```
- What ab is ?
    - ab = Apache HTTP server benchmarking tool
    - Purpose: simulate multiple HTTP requests to a web server to measure:
    - Requests per second
    - Response time
    - Failures
    - Throughput
    - It’s great for quick load testing, especially during development or for small demos.
- -n 1000	Total number of HTTP requests to send
- -c 1000	Number of concurrent requests at the same time (quest per time)
- <url>	The target URL to test (e.g., http://myapp.example.com/)


```bash
kubectl taint nodes master-seang node-role.kubernetes.io/control-plane:NoSchedule-
```
It REMOVES the taint from the master node.

Argocd
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

```
it commadn is used to get initial-admin-secrete after that this comment won't work any more

admin
seang0405
