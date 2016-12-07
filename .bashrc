# Check for an interactive session
stty -ixon
#☺ ► ๏ ♕ ☢ ☣ ☻ ☺ ☠ 🌲
HISTCONTROL=ignoreboth
HISTSIZE=5000

# This ...should load RVM into a shell session.
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

[[ -s $HOME/.env ]] && source $HOME/.env


export SVN_EDITOR='vim'
export PATH=$PATH:/Development/android-sdk-macosx/platform-tools:/Development/android-sdk-macosx/tools #android
export PATH=./bin:/Users/michaeljoseph/.rvm/rubies/ruby-2.3.1/bin:/Users/michaeljoseph/.rvm/gems/ruby-2.3.1/bin:/usr/local/bin:/opt/node/bin:$HOME/.rvm/bin:$HOME/.scripts:/usr/local/rvm/bin:/usr/bin:$PATH
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
function b() { sudo tee /sys/class/backlight/intel_backlight/brightness <<< $1; }
alias c='google-chrome-stable'
alias d='google-chrome-stable --app=https://app.dictate.life'
alias lock='i3lock'
alias pu='sudo pacman -Syu'
alias pi='packer -S $1'
alias pss='packer -Ss $1'

alias vi='vim'
alias gob='ssh secure'
alias wing='ssh winger'
alias wl='ssh winger.local'
alias gl='ssh abed'
alias fin='open -a finder $1'
alias sub='open -a Sublime\ Text\ 2 $1'
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

#Joyable
alias jstart='docker-sync-stack clean && docker-sync-stack start'
alias jbuild='docker-compose build'
alias jmerge='git merge --ff-only $1'
alias jseed='dev run rake db:seed'
alias jmigrate='dev run rake db:migrate'

alias cdj='cd ~/Dropbox/Work/Joyable/joyable'
alias cdj2='cd ~/Dropbox/Work/Joyable/joyable2'
alias jpr='open https://github.com/Joyable/joyable/compare/master...`current_branch`'

#ig
alias clearrediscache='redis-cli -p  6379 -n 2 keys "*" | xargs redis-cli -p 6379 -n 2 del $1'
alias fs='foreman start && passenger stop'
alias ms='rails s -p 3001'
alias snapshots='psql -U $USER -c "\list" postgres'

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

#OS X - Sets a file as hidden
alias hideFile='SetFile -a V $1'
#OS X - Sets a file as visible
alias showFile='SetFile -a v $1'

#list directories by size
alias qdu='du -h -d 1 . | sort -n -r'

alias cdr='cd ~/Dropbox/Work/RailsTasks3/'

alias cdb='cd ~/Dropbox/Work/Blinky'

alias removedbconflicts="find . -name \*\'s\ conflicted\ copy\ \* -exec mv -v {} ~/.Trash/ \;"

################################################################################

################################################################################
#Git stuff
function gc() { git add . && git add -u . && git commit -am"$*"; }
function gca() { git commit --amend -m"$*"; }
alias gp='git push'
alias gd='git diff'

alias gi='git log --all --oneline --color --decorate'
alias gg='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --decorate'
alias glo='git log --oneline --no-merges master..'
alias gco='git checkout $1'
alias gcl='git clone $1'
alias gm='git checkout master'
alias gb='git branch'
alias gs='gg --grep $1' #git search
alias gprune='git remote prune origin'
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

function dstaging() {
  branch=$(current_branch);
  git push staging +${branch}:master;
}

function dsassy {
  branch=$(current_branch);
  git push sassy +${branch}:master;
}

function dfluffy {
  branch=$(current_branch);
  git push fluffy +${branch}:master;
}

alias sc='sass --watch app/sass/:public/stylesheets/'

alias formatjson='pbpaste | python -m json.tool'
alias fj='formatjson'

################################################################################
alias setpostgresmem='sudo sysctl -w kern.sysv.shmmax=12582912;sudo sysctl -w kern.sysv.shmall=12582912'
alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppostgres='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias 'mailcatcher'='mailcatcher --http-ip 0.0.0.0'

################################################################################

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
