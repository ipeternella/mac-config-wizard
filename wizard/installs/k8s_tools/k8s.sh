read -r -p "[K8S]: Install kubectl? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then

    echo "Installing kubectl to access K8s cluster master endpoint..."
    brew install kubectl

fi