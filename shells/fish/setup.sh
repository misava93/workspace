#!/usr/bin/env bash

# Install fish shell
brew install fish

# Copy core fish functions
cp -R ./functions/* ~/.config/fish/functions

# Make fish the login shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# Install Fisher (fish plugin manager)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install fish ssh-agent plugin
fisher install danhper/fish-ssh-agent

# Install SDKMAN! (SDK pkg manager)
curl -s "https://get.sdkman.io" | bash

# Install SDKMAN fish plugin
fisher install reitzig/sdkman-for-fish@v1.4.0

