#
# IDEs and text editors
#
read -r -p "[CODING TOOLS]: Install VSCode? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing VSCode..."
    brew cask install visual-studio-code
fi