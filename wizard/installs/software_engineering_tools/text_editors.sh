#------------------------------------------------------------
# Text editors such as VSCode and Sublime.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[SOFTWARE ENG. TOOLS]: Install VSCode? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing VSCode..."
    brew cask install visual-studio-code
fi

read -r -p "[SOFTWARE ENG. TOOLS]: Install Sublime Text? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Sublime Text..."
    brew cask install sublime-text
fi