#!/usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz &&
  sudo rm -rf /opt/nvim-linux-x86_64 &&
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz &&
  echo 'eval "$(starship init bash)"' >>~/.bashrc &&
  echo 'export PATH=/opt/nvim-linux-x86_64/bin/:$PATH' >>~/.bashrc
