# replace this with your own gcp project id and service account name
PROJECT_ID=sample-playground
SA_NAME=crossplane-sa-name

# create service account
SA="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" 
gcloud iam service-accounts create $SA_NAME --project $PROJECT_ID

# grant access to cloud API
ROLE1="roles/container.clusterAdmin"
ROLE2="roles/iam.serviceAccountUser"
gcloud projects add-iam-policy-binding --role="$ROLE1" $PROJECT_ID --member "serviceAccount:$SA"
gcloud projects add-iam-policy-binding --role="$ROLE2" $PROJECT_ID --member "serviceAccount:$SA"

# create service account keyfile
gcloud iam service-accounts keys create creds.json --project $PROJECT_ID --iam-account $SA
