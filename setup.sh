#!/bin/bash

# set up the plugin 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# :PlugInstall to install everything
