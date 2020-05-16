#------------------------------------------------------------
# IDEs for coding software projects.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[SOFTWARE ENG. TOOLS]: Install Pycharm? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Pycharm..."
    brew cask install pycharm
fi