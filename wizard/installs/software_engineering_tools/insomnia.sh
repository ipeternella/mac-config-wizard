read -r -p "[DEV UTILITIES]: Install Insomnia? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Insomnia..."
    brew cask install insomnia
fi
