# set up dev dirs
mkdir ~/dev

# dosfstools
sudo pacman -S dosfstools
yay -S bind-tools

# tui monitor mgmt
yay -S hyprmon-bin
# brightness util
yay -S ddcutil

# alternate browsers
yay -S helium-browser-bin

# ts friends
sudo pacman -S nodejs npm
npm config set os linux
sudo pacman -S pnpm
pnpm setup
source ~/.bashrc
pnpm add turbo --global

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
yay -S pulumi
yay -S terraform
yay -S google-cloud-cli

yay -S claude-code
yay -S opencode

yay -S mysql-clients84



source ~/.bash_profile

