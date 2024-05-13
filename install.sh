#ssh-keygen -t ssh-ed25519
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# build from brewfile
brew bundle install 

# set up git & shell configs 
cp gitconfig ~/.gitconfig
cp zshrc ~/.zshrc
cp p10k.zsh ~/.p10k.zsh

# set up .config dir
mkdir -p ~/.config/kitty/
mkdir -p ~/.config/direnv/
mkdir -p ~/.config/zed/
cp kitty/* ~/.config/kitty/
cp direnv/* ~/.config/direnv/
cp zed/* ~/.config/zed/

# set up vim
bash scripts/vim_install.sh
cp vimrc ~/.vimrc

# install go
bash scripts/go_install.sh
 
