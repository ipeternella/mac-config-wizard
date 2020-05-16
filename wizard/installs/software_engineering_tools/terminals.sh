#------------------------------------------------------------
# IDEs for coding software projects.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[SOFTWARE ENG. TOOLS]: Install Fish shell? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing Fish..."
    brew install fish

    echo "Getting oh-my-fish shell script..."
    curl -L https://get.oh-my.fish | fish

    # Fish shell be executed, quit it!
    echo "Configuring bobthefish theme..."
    omf install bobthefish

    echo "Tapping new fonts formulae to brew..."
    brew tap homebrew/cask-fonts
    brew cask install font-firacode-nerd-font  
    set -U theme_nerd_fonts yes

    echo "Adding powerline fonts for iTerm2..."
    git clone https://github.com/powerline/fonts.git
    cd fonts
    bash ./install.sh
    cd ..
    rm -rf fonts

    echo "Adding fish to etc/shells..."
    echo /usr/local/bin/fish | sudo tee -a /etc/shells

    echo "Setting Fish as the main shell..."
    chsh -s /usr/local/bin/fish

    echo "Configuring bash_profile variables export..."
    echo 'egrep "^export " ~/.bash_profile | while read e
    set var (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\1/")
    set value (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\2/")

    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

    if test $var = "PATH"
        # replace ":" by spaces. this is how PATH looks for Fish
        set value (echo $value | sed -E "s/:/ /g")

        # use eval because we need to expand the value
        eval set -xg $var $value

        continue
    end

    # evaluate variables. we can use eval because we most likely just used "$var"
    set value (eval echo $value)

    set -xg var $value  # <---- important new fish syntax

    # for pyenv to work with fish
    set PYENV_ROOT $HOME/.pyenv
    set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/versions $PATH
    pyenv rehash
    end' >> ~/.config/omf/init.fish
fi