#!/bin/sh

vimrc_path=~/.vimrc
bash_profile_path=~/.bash_profile
git_prompt_path=~/.git-prompt.sh

function copyvim {
  cp -f ./vim_setting $vimrc_path; rm -rf ~/.vim/bundle
  mkdir -p ~/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
  # cd ~/.vim/bundle/vimproc; make;  so file will generate
}

function copybash {
  cp -f ./bash_profile $bash_profile_path
  source $bash_profile_path
}

function copygitprompt {
  cp -f ./git-prompt.sh $git_prompt_path
}

# .vimrc file copy
if [ -f $vimrc_path ]; then
  echo -n "$vimrc_path is exist! do you want to override it ? [y/n]"
  read asw
  if [ $asw = 'y' ]; then
    copyvim
  fi
else
  copyvim
fi

# git-prompt copy
if [ -f $git_prompt_path ]; then
  echo -n "$git_prompt_path is exist! do you want to override it ? [y/n]"
  read aws
  if [ $aws = 'y' ]; then
    copygitprompt
  fi
else
  copygitprompt
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
