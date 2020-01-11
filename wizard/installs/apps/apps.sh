#
# Apps & Utilities
#
read -r -p "[APPS]: Install Google Chrome? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Google Chrome..."
    brew cask install google-chrome
fi

read -r -p "[APPS]: Install Iterm2? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Iterm2..."
    brew cask install iterm2
fi

read -r -p "[APPS]: Install Alfred? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Alfred..."
    brew cask install alfred
fi

read -r -p "[APPS]: Install Slack? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Slack with brew..."
    brew cask install slack
fi

read -r -p "[APPS]: Install Tunnelblick (OpenVPN client)? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Tunneblick..."
    brew cask install tunnelblick
fi