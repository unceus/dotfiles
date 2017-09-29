# Check for an interactive session
stty -ixon
#☺ ► ๏ ♕ ☢ ☣ ☻ ☺ ☠ 🌲
HISTCONTROL=ignoreboth
HISTSIZE=5000
export EDITOR=vim

# This ...should load RVM into a shell session.
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

[[ -s $HOME/.env ]] && source $HOME/.env

export RABBITMQ_URL='amqp://guest:guest@localhost/dictate'
export SVN_EDITOR='vim'
export PATH=$PATH:/Development/android-sdk-macosx/platform-tools:/Development/android-sdk-macosx/tools #android
#export PATH=$PATH:$HOME/.rvm/rubies/ruby-2.3.1/bin
export PATH=$HOME/.rvm/gems/ruby-2.4.1/bin:$HOME/.rvm/gems/ruby-2.3.1/bin:/usr/local/bin:/opt/node/bin:$HOME/.rvm/bin:$HOME/.scripts:/usr/local/rvm/bin:/usr/bin:$HOME/.gem/ruby/2.3.1/bin:$HOME/.gem/ruby/2.4.1/bin:./bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
[ -z "$PS1" ] && return
export XENVIRONMENT="${HOME}/.Xresources"
#Show git status in the bash prompt
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f $HOME/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

#Git completion for the server
if [ -f $HOME/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

#Bash prompt
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[3;32m\]$(__git_ps1 "(%s)")☺\[\e[m\] \[\e[1;37m\]'
#PS1='[ \[\e[0;32m\]\u\[\e[m\] | \[\e[1;34m\]\W\[\e[m\] \[\e[3;32m\]$(__git_ps1 "(%s)") ] ☺\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[1;30m\].\[\e[m\]\[\e[0;37m\]\u\[\e[m\] \[\e[1;30m\]»\[\e[m\] \[\e[0;32m\]\W\[\e[m\]\[\e[1;33m\] $(__git_ps1 "(%s)")\[\e[m\]\[\e[3;32m\]☺\[\e[m\] \[\e[1;37m\]'
PS1='\[\e[1;36m\]\h.\[\e[m\]\[\e[0;32m\]\W\[\e[m\]\[\e[1;33m\] $(__git_ps1 "(%s)")\[\e[m\]\[\e[3;32m\]🌲 \[\e[m\]\[\e[1;37m\]'
#git line - standalone
#PS1='$(__git_ps1 "(%s)")'

################################################################################
#Aliases
#linux
alias xterm='xterm -tn xterm-256color'
alias sctl='sudo systemctl'
alias c='google-chrome-stable'
alias d='google-chrome-stable --app=https://app.dictate.life'
alias lock='i3lock'
alias pu='sudo pacman -Syu'
alias pi='packer -S $1'
alias pss='packer -Ss $1'
alias pacmanremoveorphans='pacman -Rns $(pacman -Qtdq)'
alias define='sdcv'

alias vi='vim'
alias gob='ssh secure'
alias wing='ssh winger'
alias wl='ssh winger.local'
alias gl='ssh abed'
alias fin='open -a finder $1'
alias sub='open -a Sublime\ Text $1'
alias 'git-gui'='/usr/local/Cellar/git/1.7.12/libexec/git-core/git-gui'
alias sublime='open -a Sublime\ Text\ 2 $1'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --disable-web-security --allow-running-insecure-content'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security --allow-running-insecure-content'
alias simulator='open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator'
alias removesvn='rm -rf `find . -type d -name .svn`'
alias restoreprod='development restore production && rake jobs:clear db:migrate db:seed db:anonymize'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias dockerenv='eval $(docker-machine env)'
alias dockercleanimages='docker rmi $(docker images | ag "^<none>" | sed "s/  */ /g" | cut -d " " -f3)'
alias removeunusedpackages='pacman -Rsn $(pacman -Qdtq)'
alias iex='rlwrap -a -A iex'
alias mt='JWT_SECRET=fartz mix test --trace'
alias mti='JWT_SECRET=fartz iex -S mix test --trace'
alias deploy='git push dokku --force --no-verify'
function encrypt() { openssl aes-256-cbc -salt -in $1 -out $2; }
function decrypt() { openssl aes-256-cbc -d -salt -in $1 -out $2; }

#rails
alias rr="rake routes | grep $1"

#ig
alias clearrediscache='redis-cli -p  6379 -n 2 keys "*" | xargs redis-cli -p 6379 -n 2 del $1'
alias fs='foreman start && passenger stop'

alias mpc='mpc -h abed'
alias mpd='mpd /etc/mpd.conf --no-daemon'
alias ss='screen -S $1'
alias sr='screen -x $1'
alias sls='screen -ls'
function sd() { screen -X -S $1 quit; }

alias tmux='TERM=screen-256color-bce tmux'
alias ts='TERM=screen-256color-bce tmux new -s $1'
alias tr='tmux at -d -t $1'
alias td='tmux attach -d' #not tested with multiple sessions
alias tls='tmux ls'

alias ob='vim $HOME/.bashrc'
alias sb='source $HOME/.bashrc'

alias fp='ps aux -ww | ag $1'

#Color ls
alias ls='ls -G'

#list directories by size
alias qdu='du -h -d 1 . | sort -n -r'

alias cde='cd ~/Dropbox/Work/Dictate_Elixir/dictate_umbrella'
alias cdd='cd ~/Dropbox/Work/dictate_ember'
alias cdh='cd ~/Dropbox/Work/hsl'

alias cdb='cd ~/Dropbox/Work/Blinky'

alias removedbconflicts="find . -name \*\'s\ conflicted\ copy\ \* -exec rm -rf {} \;"

################################################################################

################################################################################
#Git stuff
function gc() { git add . && git add -u . && git commit -am"$*"; }
function gca() { git commit --amend -m"$*"; }
alias gp='git push -u'
alias gd='git diff'
alias gds='git diff --staged'

alias gi='git log --all --oneline --color --decorate'
alias gg='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --decorate'
alias glo='git log --oneline --no-merges master..'
alias gco='git checkout $1'
alias gcl='git clone $1'
alias gm='git checkout master'
alias gb='git branch'
alias gs='gg --grep $1' #git search
alias gprune='git remote prune origin'
function track() {
  branch=$(current_branch);
  git branch --set-upstream-to=origin/${branch}
  }
function gss() { git stash save "$*"; }
alias gsl='git stash list'
alias gpf='git push --force'
function gri() { git rebase --interactive HEAD~${1//[[:blank:]]/}; }
alias grhh='git reset --hard HEAD'
alias grsh='git reset --soft HEAD^'
function gsr() { git diff stash@{${1}}; }
function gsa() { git stash apply stash@{"$*"}; }
function gsp() { git stash pop stash@{"$*"}; }

function current_branch() {
  branch=$(git symbolic-ref -q HEAD)
  branch=${branch##refs/heads/}
  branch=${branch:-HEAD}
  echo "$branch"
}

################################################################################
alias setpostgresmem='sudo sysctl -w kern.sysv.shmmax=12582912;sudo sysctl -w kern.sysv.shmall=12582912'
alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppostgres='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

#enable GRC
if [ "command -v grc" ]; then
    GRC=`which grc`
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias cat='colourify cat'
    alias traceroute='colourify /usr/sbin/traceroute'
fi

if [ "command -v DNSSD" ]; then
  alias listbonjourservers="dns-sd -B _afpovertcp._tcp ."
fi

export PATH="$HOME/.yarn/bin:$PATH"
source /usr/share/nvm/init-nvm.sh
