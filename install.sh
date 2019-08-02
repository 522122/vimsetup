#!/bin/bash

option=""

print_menu() {
  echo "1. Install"
  echo "5. Exit"
}

install_pathogen() {
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

install_plugins() {
  git clone https://github.com/neoclide/coc.nvim  --branch release ~/.vim/bundle/coc.nvim
  git clone https://github.com/mattn/emmet-vim ~/.vim/bundle/emmet-vim
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  git clone https://github.com/junegunn/fzf ~/.vim/bundle/fzf
  git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim
  git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
  git clone https://github.com/xuyuanp/nerdtree-git-plugin ~/.vim/bundle/nerdtree-git-plugin
  git clone https://github.com/tpope/vim-fugitive ~/.vim/bundle/vim-fugitive
  git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
  git clone https://github.com/sheerun/vim-polyglot ~/.vim/bundle/vim-polyglot
  git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
  git clone https://github.com/ap/vim-css-color ~/.vim/bundle/vim-css-color
  git clone https://github.com/prettier/vim-prettier ~/.vim/bundle/vim-prettier
  git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes
  git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
}

install_theme() {
  git clone --depth=1 https://github.com/tomasiser/vim-code-dark.git ~/vim-code-dark && 
  rm -rf ~/vim-code-dark/.git ~/vim-code-dark/LICENSE.md ~/vim-code-dark/README.md ~/vim-code-dark/base16 && 
  cp -r ~/vim-code-dark/* ~/.vim/ && rm -rf ~/vim-code-dark
}

remove_plugins() {
  rm -rf ~/.vim/bundle
}

install_configs() {
  cat vimrc > ~/.vimrc
  cat coc-settings.json > ~/.vim/coc-settings.json
}


install_all() {
  install_pathogen
  install_plugins
  install_configs
  install_theme
}

while [ "$option" != "5" ]; do
 
  print_menu
  read option

  if [ "$option" == "1" ]; then
    remove_plugins
    install_all
    echo "Done"
  fi

done

