#------------------------------------------------------------
# REST clients such as Insomnia and Postman.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[SOFTWARE ENG. TOOLS]: Install Insomnia? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Installing Insomnia..."
    brew cask install insomnia

fi

read -r -p "[SOFTWARE ENG. TOOLS]: Install Postman? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Installing Postman..."
    brew cask install postman

fi