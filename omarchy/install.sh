# set up dev dirs
mkdir ~/dev

# needed for zed editor
sudo pacman -S vulkan-radeon

# ts friends
sudo pacman -S nodejs npm
npm config set os linux
sudo pacman -S pnpm

# ai coding
npm install -g @anthropic-ai/claude-code

yay -S kitty
yay -S zed
