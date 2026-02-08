---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: my-cert # it will create a certificate resource named my-cert that have namesoace default
  namespace: default # default namespace is created if not specified
  annotations: # gernerally we use annotations to provide metadata to resources and here we are using it to specify the ingress class for cert-manager
    kubernetes.io/ingress.class: "nginx" # specify the ingress class to be used for solving the HTTP-01 challenge, this class should match the ingress controller deployed in the cluster
spec:
  dnsNames:
  - kubernete.dashboard.seang.shop
  secretName: my-tls
  issuerRef: # reference to the issuer or clusterissuer that will be used to obtain the certificate
    name: letsencrypt-prod
    kind: ClusterIssuer

this the flow of https

      +-------------------+
      |   User Browser    |
      | https://hello.e-  |   user request
      | crops.co          |
      +---------+---------+
                |
                v
      +-------------------+
      |   Ingress (nginx) |
      |   TLS Secret:     | ingress file
      |   my-tls          |
      +---------+---------+
                |
                v
      +-------------------+
      | Backend Service   |
      | nginx-svc:80      |
      +-------------------+

      <-- Certificate flow -->

+--------------------+      +-------------------------+
| ClusterIssuer      |      | Certificate             |   left is for clusterissuer.yam
| letsencrypt-prod   |----->| my-cert                 |     right is for certifaction-section.yaml
| (ACME, Let’s Encrypt)|     | dnsNames: hello.e-      |
+--------------------+      | crops.co                |
                             | secretName: my-tls     |
                             +-------------------------+

Flow:

1. ClusterIssuer talks to Let’s Encrypt to issue a certificate.
2. Certificate resource requests a cert for hello.e-crops.co via the ClusterIssuer.
3. cert-manager stores the issued certificate in secret `my-tls`.
4. Ingress uses `my-tls` secret to serve HTTPS traffic to nginx-svc.
5. User accesses your site securely via HTTPS.


Architecture

Internet (https://kubernetes.dashboard.seang.shop)
         ↓
    GCP VM External IP (35.x.x.x)
         ↓
    nginx reverse proxy (on VM)
         ↓
    Kubernetes ClusterIP: 10.233.x.x:80
         ↓
    ingress-nginx-controller pod
         ↓
    kubernetes-dashboard service (port 443)