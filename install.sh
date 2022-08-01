#!/bin/bash

cd ~/

# Copy .dotfiles from git repo
git clone git@github.com:r-glebov/dotfiles.git ~/.dotfiles

dotfiles_dir=~/.dotfiles

# Symlink the files
mkdir -p ~/.config/nvim
ln -sf $dotfiles_dir/nvim ~/.config/nvim

# Run nvim command to install plugins
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'

# Run nvim command to install Treesitter languages
RUN nvim --headless -c 'set cmdheight=50' -c 'silent TSInstallSync all' -c 'sleep 20' -c 'qall'

