# set up dev dirs
mkdir ~/dev

# needed for zed editor
sudo pacman -S vulkan-radeon

# ts friends
sudo pacman -S nodejs npm
npm config set os linux
sudo pacman -S pnpm
yay -S zed
yay -S kitty

# ai coding
# npm install -g @anthropic-ai/claude-code

curl -fsSL https://claude.ai/install.sh |bash
yay -S flyctl
yay -S infisical-bin
