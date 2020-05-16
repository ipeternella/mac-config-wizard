#------------------------------------------------------------
# Cloud command line tools such as gcloud and aws cli.
# Also runs some configurations.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[CLOUD TOOLS]: Install awscli? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Installing awscli..."
    brew install awscli

fi

read -r -p "[CLOUD TOOLS]: Would you like to configure awscli now? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    # "For no token-refreshing authentication for ECR, visit: https://github.com/awslabs/amazon-ecr-credential-helper"

    echo "Configuring authentication with AWS Services..."
    aws configure

    echo "Installing aws-iam-authenticator to use IAM for EKS cluster authentication..."
    brew install aws-iam-authenticator

    echo "Testing sts get-caller-identity token return..."
    aws sts get-caller-identity

    echo "Creating a new kubeconfig for cluster authentication with aws cli..."

    read -r -p "[CLOUD TOOLS]: What is your AWS EKS region?" aws_region
    read -r -p "[CLOUD TOOLS]: What is your EKS cluster name?" eks_cluster_name
    aws eks --region $aws_region update-kubeconfig --name $eks_cluster_name

fi


read -r -p "[CLOUD TOOLS]: Install google-cloud-sdk? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Installing google cloud sdk..."
    brew cask install google-cloud-sdk

fi

read -r -p "[CLOUD TOOLS]: Would you like to configure google sdk now? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Configuring authentication with GCP..."
    gcloud auth login --brief

    echo "Configuring Docker client authentication to access GCP registries..."
    gcloud auth configure-docker

    echo "Creating a new kubeconfig for cluster authentication with gcloud cli..."
    read -r -p "[CLOUD TOOLS]: What is your GKE cluster name?" gke_cluster_name
    gcloud container clusters get-credentials gke_cluster_name

fi
