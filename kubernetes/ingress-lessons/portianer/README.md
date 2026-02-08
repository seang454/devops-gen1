helm repo add portainer https://portainer.github.io/k8s/
helm repo update

# http
helm upgrade --install portainer portainer/portainer \
  -n portainer --create-namespace \
  --set enterpriseEdition.enabled=true \
  --set enterpriseEdition.image.tag=lts \
  --set service.type=ClusterIP \
  --set tls.force=true \
  --set ingress.enabled=true \
  --set ingress.ingressClassName=nginx \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"=HTTPS \
  --set 'ingress.hosts[0].host=portainer.seang.shop' \
  --set 'ingress.hosts[0].paths[0].path=/'

# HTTPS
helm upgrade --install portainer portainer/portainer \
  -n portainer --create-namespace \
  --set enterpriseEdition.enabled=true \
  --set enterpriseEdition.image.tag=lts \
  --set service.type=ClusterIP \
  --set tls.force=true \
  --set ingress.enabled=true \
  --set ingress.ingressClassName=nginx \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"=HTTPS \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod \
  --set 'ingress.hosts[0].host=portainer.free.seang.shop' \
  --set 'ingress.hosts[0].paths[0].path=/' \
  --set 'ingress.tls[0].secretName=portainer-tls' \
  --set 'ingress.tls[0].hosts[0]=portainer.free.seang.shop'

helm repo add portainer https://portainer.github.io/k8s/
helm repo update


How to set up Community Version for Portainer
1. helm repo add portainer https://portainer.github.io/k8s/
2. helm repo update
3. using NodePort
  helm upgrade --install --create-namespace -n portainer portainer portainer/portainer \
    --set tls.force=true \
    --set image.tag=lts
4. access the NodePort to get its Dashboard
5. initainlize by create username , password
6. change NodePort to clusterIP
7. using ingress to set up HTTP or HTTPs
8. Access domain to use get Portainer Dashboard UI agian 


