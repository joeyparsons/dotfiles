# set up dev dirs
mkdir ~/dev

# tui monitor mgmt
yay -S hyprmon-bin

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


# dev tooling
yay -S flyctl
yay -S infisical-bin
curl -fsSL https://bun.sh/install | bash

yay -S claude-code
yay -S opencode


source ~/.bash_profile

