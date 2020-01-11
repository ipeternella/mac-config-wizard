SSH_FOLDER=~/.ssh
SSH_KEYCHAIN_CONFIG='Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa'

# creation of new ssh_key
read -r -p "[GIT]: Configuring git. What's your GIT email for the SSH key creation?" response

echo "[GIT]: Creating new PRIVATE ssh-key..."
ssh-keygen -t rsa -b 4096 -C "$response"

echo "[GIT]: Starting the ssh-agent..."
eval "$(ssh-agent -s)"

echo "[GIT]: Adding the PRIVATE ssh-key to the ssh-agent"
[[ ! -d $SSH_FOLDER ]] && mkdir $SSH_FOLDER && echo "Created new ssh folder: $SSH_FOLDER"
ssh-add -K $SSH_FOLDER/id_rsa

echo "[GIT]: Changing ssh config to automatically load the ssh-key..."
echo "Appending config to ssh-config file..."
echo "$SSH_KEYCHAIN_CONFIG" >> $SSH_FOLDER/config

pbcopy < ~/.ssh/id_rsa.pub
echo "[GIT]: A new SSH key pair has been created. The PUBLIC key has been copied to clipboard for Github ssh configuration!"