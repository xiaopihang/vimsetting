#!/bin/sh

vimrc_path=~/.vimrc
bash_profile_path=~/.bash_profile

function copyvim {
  cp ./vim_setting $vimrc_path
  mkdir -p ~/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimprocvim
}

function copybash {
  cp ./bash_profile $bash_profile_path
}

if [ -f $vimrc_path ]; then
  echo -n "$vimrc_path is exist! do you want to override it ? [y/n]"
  read asw
  if [ $asw = 'y' ]; then
    copyvim
  fi
else
  copyvim
fi


# bash_profile copy
if [ -f $bash_profile_path ]; then
  echo -n "$bash_profile_path is exist! do you want to override it ? [y/n]"
  read asw
  if [ $asw = 'y' ]; then
    copybash
  fi
else
  copybash
fi
