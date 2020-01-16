#!/bin/bash
set -x

# tmux
cp -rf tmux/.* ~

# files
cp -f .bashrc ~
cp -f .vimrc ~
cp -f .dir_colors_trapd00r ~/.dir_colors
cp -f .ctags ~
cp -f .gitconfig ~
cp -f .git-prompt.sh ~

# directories
cp -rf .vim ~
cp -rf .keychain ~
cp -rf bin ~
cp -rf .rbenv ~
