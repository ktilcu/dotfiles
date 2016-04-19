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
alias mkdir='mkdir -p'
alias reload!='. ~/.zshrc'
alias t='task'
alias ta='task add'
alias dm='docker-machine'
alias dmsd='docker-machine start dev'

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
alias gl="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias gm="git merge --ff"
alias gp="git push"
alias gpom="git pull --rebase origin master"
alias gpoh="git push origin HEAD"
alias gpt="git push --tags"
alias gpum="git pull --rebase upstream master"
alias grh="git reset --hard"
alias gs="git status"
alias ts="tig status"

function dc () {
  docker images -f 'dangling=true' -q | xargs docker rmi
  docker rm $(docker ps -a -q)
  docker images -f 'dangling=true' -q | xargs docker rmi
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

alias ios="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

