#------------------------------------------------------------
# Applications with GUI such as Chrome, Slack, etc.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[APPS]: Install Google Chrome? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Google Chrome..."
    brew cask install google-chrome
fi

read -r -p "[APPS]: Install Iterm2? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Iterm2..."
    brew cask install iterm2
fi

read -r -p "[APPS]: Install Alfred? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Alfred..."
    brew cask install alfred
fi

read -r -p "[APPS]: Install Slack? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Slack with brew..."
    brew cask install slack
fi

read -r -p "[APPS]: Install Tunnelblick (OpenVPN client)? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Tunneblick..."
    brew cask install tunnelblick
fi