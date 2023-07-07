#!/bin/bash

[[ -d "$HOME/bin" ]] || mkdir "$HOME/bin"

cd "$HOME/bin"
FILE="nvim-macos.tar.gz"
nvim --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "downloading nvim..."
    curl -# -OL 'https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-macos.tar.gz'
    tar xzf nvim-macos.tar.gz
    rm $FILE
    ln -s nvim-macos/bin/nvim nvim
fi

tput setaf 2;
echo "nvim [installed]"
tput init;

FILE2="clangd-mac-14.0.3.zip"
clangd --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "downloading clangd..."
    curl -# -OL "https://github.com/clangd/clangd/releases/download/14.0.3/$FILE2"
    unzip -q $FILE2
    rm $FILE2
    mv clangd_* clangd_dir
    ln -s clangd_dir/bin/clangd clangd
fi

tput setaf 2;
echo "clangd [installed]"
tput init;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
