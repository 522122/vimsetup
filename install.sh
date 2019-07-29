#!/bin/bash

option=""

print_menu() {
  echo "1. Install all"
  echo "1F Install all force, clean bundle " 
  echo "2. Install pathogen"
  echo "3. Install plugins"
  echo "3F Install plugins, clean bundle"
  echo "4. Install .vimrc"
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

remove_plugins() {
  rm -rf ~/.vim/bundle
}

install_vimrc() {
  cat vimrc > ~/.vimrc
}

install_colors() {
  mkdir ~/.vim/colors 2>/dev/null
  cat paramount.vim > ~/.vim/colors/paramount.vim
}

install_all() {
  install_pathogen
  install_plugins
  install_vimrc
  install_colors
}

while [ "$option" != "5" ]; do
 
  print_menu
  read option

  if [ "$option" == "1" ]; then
    install_all
    echo "Done"
  fi

  if [ "$option" == "1F" ]; then
    remove_plugins
    install_all
    echo "Done"
  fi

  if [ "$option" == "2" ]; then
    install_pathogen
    echo "Done"
  fi

  if [ "$option" == "3" ]; then
    install_plugins
    echo "Done"
  fi

  if [ "$option" == "3F" ]; then
    remove_plugins
    install_plugins
    echo "Done"
  fi

  if [ "$option" == "4" ]; then
    install_vimrc
    echo "Done"
  fi

done

