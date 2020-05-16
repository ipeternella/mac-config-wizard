#------------------------------------------------------------
# K8s tools such as kubectl.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[K8S]: Install kubectl? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Installing kubectl to access K8s cluster master endpoint..."
    brew install kubectl

fi