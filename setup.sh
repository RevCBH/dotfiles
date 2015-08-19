#!/usr/bin/env bash

pushd .vim > /dev/null
/usr/bin/env bash setup.sh
popd > /dev/null

git config --global core.excludesfile `pwd`/global_gitignore

if [ -f ~/.bashrc ]; then
  echo $'\e[1;4;33mWARNING\e[0m -' "$HOME/.bashrc already exists."
  read -p "[s]kip, [r]eplace, or [a]ppend? [s]: " -n 1 wutdo
  echo ""

  if [[ "$wutdo" == "r" ]]; then
    cp dot_bashrc ~/.bashrc
  elif [[ "$wutdo" == "a" ]]; then
    cat dot_bashrc >> ~/.bashrc
  fi
else
  cp dot_bashrc ~/.bashrc
fi

#if [ -e ~/.gvimrc ]; then
	#mv ~/.gvimrc ~/.gvimrc.old
#fi

#ln -s `pwd`/.vimrc ~/.vimrc
#ln -s `pwd`/.gvimrc ~/.gvimrc

#mkdir -p ~/.vim/after
#cp -R ./.vim/after ~/.vim/
#mkdir -p ~/.vim/autoload
#cp -R ./.vim/autoload ~/.vim/
#mkdir -p ~/.vim/bundle
#cp -R ./.vim/bundle ~/.vim/
#mkdir -p ~/.vim/colors
#cp -R ./.vim/colors ~/.vim/
