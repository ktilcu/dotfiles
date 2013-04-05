alias reload!='. ~/.zshrc'
alias ls='ls -G'
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h='history'
alias mkdir='mkdir -p'
alias tunnel='ssh -nNT -R 19999:localhost:22 kyletilman@24.160.104.164 -p22'
alias la='ls -a'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
# exports

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export HISTTIMEFORMAT="%F %T " 
export LSCOLORS=cxfxcxdxbxexexabagacad
# functions
# change to dev directory
cdd () { 
  repo_folder="/Users/trike/development"
  test=`find $repo_folder/* -maxdepth 0 -type d | grep -i "$1" -m 1`
  if [ ! $1 ] || [ ! $test ]; then
    cd $repo_folder
  else
    cd $test
  fi 
}

# move videos
mvid (){
  rsync --include='*/' --include '*.mov' --include '*.m4v' --include '*.mp4' --exclude '*' -avz $1* $2
}

# move and go to dir
mvgo (){
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

# mkdir and cd
mkcd () {
  mkdir $1 && cd $1
}