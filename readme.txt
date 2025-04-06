

# GCP setting:
export BILLING_ACC="01F0C7-9A2082-488963"
export PROJECT_INFRA_NAME="dynamic-run-portfolio"
export PROJECT_INFRA_ID="${PROJECT_INFRA_NAME}1"
gcloud projects create $PROJECT_INFRA_ID --name=$PROJECT_INFRA_NAME --labels=owner=guilhermeviegas,environment=dev --enable-cloud-apis
gcloud beta billing projects link $PROJECT_INFRA_ID --billing-account=$BILLING_ACC
gcloud config set project $PROJECT_INFRA_ID
cd Documents/17-dynamic-run-portfolio/

# APIs enabling:
gcloud services enable compute.googleapis.com --project=$PROJECT_INFRA_ID
gcloud services enable dns.googleapis.com --project=$PROJECT_INFRA_ID
gcloud services enable iam.googleapis.com --project=$PROJECT_INFRA_ID
# gcloud services enable cloudresourcemanager.googleapis.com --project=$PROJECT_INFRA_ID
gcloud services enable secretmanager.googleapis.com --project=$PROJECT_INFRA_ID
 

# Flutter app:
flutter config --enable-web
flutter create flutter_app
cd flutter_app
flutter run -d web


# Build:
docker build -t guigo13/dynamic-run-portfolio .

# Run:
docker run -p 8080:80 guigo13/dynamic-run-portfolio

docker push guigo13/dynamic-run-portfolio


gcloud auth configure-docker
docker tag flutter-app gcr.io/YOUR_PROJECT_ID/flutter-app
docker push gcr.io/YOUR_PROJECT_ID/flutter-app
docker build -t gcr.io/$PROJECT_ID/$IMAGE_NAME .
docker push gcr.io/$PROJECT_ID/$IMAGE_NAME



gcloud run deploy flutter-app --image gcr.io/YOUR_PROJECT_ID/flutter-app --platform managed --allow-unauthenticated --region us-central1









terraform init 
terraform apply
terraform state list

terraform state show module.network.google_dns_record_set.tf_a_record

# Get a graph viz:
terraform graph | dot -Tsvg > graph.svg
