#!/usr/bin/env zsh
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...='cd ../..'
alias ..='cd ..'
alias cd..="cd .."
alias h='history'
alias l="ls -al"
alias la='ls -a'
alias ll='ls -l'
alias lp="ls -p"
alias ls='ls -G'
alias t='tasks'
alias ta='tasks add'
alias te='tasks edit'
alias mkdir='mkdir -p'
alias reload!='. ~/.zshrc'

## Jira
alias sprint='jira sprint --rapidboard "Ad Serving Scrum Board" | grep "ACTIVE" | awk '"'"'{print $4}'"'"' | xargs -I{} jira sprint --rapidboard "Ad Serving Scrum Board" --sprint {}'

## Git aliases from TJ Holowaychuk
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gc="git commit"
alias gca="git commit --amend"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcp="git cherry-pick"
alias gd="git diff | subl"
alias gf="git fetch"
alias gl="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias gm="git merge"
alias gp="git push"
alias gpom="git pull --rebase origin master"
alias gpoh="git push origin HEAD"
alias gpt="git push --tags"
alias gpum="git pull --rebase upstream master"
alias grc="git rebase --continue"
alias grh="git reset --hard"
alias grhom="git reset --hard origin/master"
alias gfrhom="git fetch && grhom"
alias gpr="git pull-request -b"
alias gprm="git pull-request -b master"
alias gppr="gpoh && gprm"
alias gs="git status"
alias ts="tig status"

alias ctags="`brew --prefix`/bin/ctags"

function dc () {
  docker images -f 'dangling=true' -q | xargs docker rmi
  docker rm $(docker ps -a -q)
  docker images -f 'dangling=true' -q | xargs docker rmi
}

function gcor (){
  git co $(git recent-branches | column -ts '|' | fzf --ansi --no-sort | sed -e 's/^[* ] //g' | cut -d' ' -f1)
}
function jms (){
    jira mine | fzf --ansi | cut -d ":" -f1
}
function jmv (){
  jira view $(jms)
}
function jmc (){
  jira comment $(jms)
}
function jmb (){
  jira browse $(jms)
}
function jme (){
  jira edit $(jms)
}

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Pipe my public key to my clipboard. Fuck you, pay me.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# Set path for node
alias nvim="PATH=\"/Users/kyletilman/.nvm/versions/node/v16.2.0/bin/:$PATH\" nvim"

# carbon
alias cws="carbonhealth-aws aws"
