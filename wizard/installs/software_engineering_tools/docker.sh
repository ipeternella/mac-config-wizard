#------------------------------------------------------------
# Docker tools.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[SOFTWARE ENG. TOOLS]: Install Docker for MacOS? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Docker..."
    brew cask install docker
fi