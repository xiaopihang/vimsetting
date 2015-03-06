WORKSPACE=~/workspace
export ws=$WORKSPACE
#export PS1="\u@\H \w > "
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\] : \[\033[33m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '

alias gco="git checkout"
alias gst="git status"
alias gci="git commit"
alias gbr="git branch -a"
alias gdi="git diff"
alias glg="git log --oneline"
alias gitk="gitk --all 2>/dev/null &"
alias gconfig="git config --list"

# ssh persistent
echo -n "ssh-agent: "
source ~/.ssh-agent-info
ssh-add -l >&/dev/null
if [ $? == 2 ] ; then
	echo -n "ssh-agent: restart...."
	ssh-agent >~/.ssh-agent-info
	source ~/.ssh-agent-info
fi

if ssh-add -l >&/dev/null ; then
	echo "ssh-agent: Identity is already stored."
else
	ssh-add
fi
