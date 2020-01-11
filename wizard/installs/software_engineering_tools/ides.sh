read -r -p "[CODING TOOLS]: Install Pycharm? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Pycharm..."
    brew cask install pycharm
fi