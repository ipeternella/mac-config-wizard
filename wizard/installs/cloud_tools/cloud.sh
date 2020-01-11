read -r -p "[CLOUD TOOLS]: Install awscli? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then

    echo "Installing awscli..."
    brew install awscli

fi

read -r -p "[CLOUD TOOLS]: Would you like to configure awscli now? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Configuring authentication with AWS Services..."
    aws configure

    echo "Configuring Docker client authentication to access AWS ECR (12 hours only)..."
    aws ecr get-login

    echo "For no token-refreshing authentication for ECR, visit: https://github.com/awslabs/amazon-ecr-credential-helper"
fi


read -r -p "[CLOUD TOOLS]: Install google-cloud-sdk? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then

    echo "Installing google cloud sdk..."
    brew cask install google-cloud-sdk

fi

read -r -p "[CLOUD TOOLS]: Would you like to configure google sdk now? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then        
    echo "Configuring authentication with GCP..."
    gcloud auth login --brief

    echo "Configuring Docker client authentication to access GCP registries..."
    gcloud auth configure-docker
fi
