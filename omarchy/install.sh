# set up dev dirs
mkdir ~/dev

# alternate browsers
yay -S helium-browser-bin

# ts friends
sudo pacman -S nodejs npm
npm config set os linux
sudo pacman -S pnpm

# needed for zed editor
sudo pacman -S vulkan-radeon

# preferred editor du jour
yay -S zed

# preferred terminal du jour
yay -S kitty

# ai coding
curl -fsSL https://claude.ai/install.sh |bash

# dev tooling
yay -S flyctl
yay -S infisical-bin
curl -fsSL https://bun.sh/install | bash


source ~/.bash_profile

