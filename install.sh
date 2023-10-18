#ssh-keygen -t ssh-ed25519
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle install 

cp gitconfig ~/.gitconfig
cp zshrc ~/.zshrc
cp p10k.zsh ~/.p10k.zsh

mkdir -p ~/.config/kitty/
mkdir -p ~/.config/direnv/
cp kitty/* ~/.config/kitty/
cp direnv/* ~/.config/direnv

bash scripts/vim_install.sh
cp vimrc ~/.vimrc

bash scripts/go_install.sh
 
