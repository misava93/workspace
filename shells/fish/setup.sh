#!/usr/bin/env bash

# Install fish shell
brew install fish

# Make fish the login shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# Install Fisher (fish plugin manager)
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install fish ssh-agent plugin
fish -c "fisher install danhper/fish-ssh-agent"

# Copy core fish functions
cp -R ./functions/* ~/.config/fish/functions

# Install SDKMAN! (SDK pkg manager)
curl -s "https://get.sdkman.io" | bash

# Install SDKMAN fish plugin
fish -c "fisher install reitzig/sdkman-for-fish@v1.4.0"

# Change fish settings
fish -c "set -U fish_color_command green"

# Switch to fish shell
exec fish
