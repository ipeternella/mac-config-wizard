read -r -p "[DEV UTILITIES]: Install Docker for MacOS? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Docker..."
    brew cask install docker
fi