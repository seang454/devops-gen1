# /bin/bash
PROJECT_ID=project-8924f831-f818-4bbd-9f9
gcloud iam service-accounts create k8s-ccm --display-name="K8S CCM"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.networkAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.securityAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.loadBalancerAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"


gcloud iam service-accounts keys create ./k8s-ccm-key.json \
    --iam-account=k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com
