# Check for an interactive session
stty -ixon
#☺ ► ๏ ♕ ☢ ☣ ☻ ☺ ☠ 🌲
HISTCONTROL=ignoreboth
HISTSIZE=50000
export EDITOR=vim

export TERM=rxvt-unicode

# This ...should load RVM into a shell session.
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

[[ -s $HOME/.env ]] && source $HOME/.env

export RABBITMQ_URL='amqp://guest:guest@localhost/dictate'
export SVN_EDITOR='vim'
export PATH=$PATH:/Development/android-sdk-macosx/platform-tools:/Development/android-sdk-macosx/tools #android
#source /usr/share/nvm/init-nvm.sh
export PATH=/usr/local/bin:/opt/node/bin:$HOME/.rvm/bin:$HOME/.scripts:/usr/local/rvm/bin:/usr/bin:$HOME/.gem/ruby/2.3.1/bin:$HOME/.gem/ruby/2.4.1/bin:./bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$HOME/.rvm/gems/ruby-2.4.1/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH=/home/m/.local/share/bob/nvim-bin:$PATH

export JAVA_HOME=/usr/lib/jvm/default

[ -z "$PS1" ] && return
export XENVIRONMENT="${HOME}/.Xresources"

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=qt5ct-style

#Show git status in the bash prompt
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f $HOME/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

#Git completion for the server
if [ -f $HOME/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

#rust
if [ -f $HOME/.cargo/env ]; then
  . "$HOME/.cargo/env"
fi

#Bash prompt
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[3;32m\]$(__git_ps1 "(%s)")☺\[\e[m\] \[\e[1;37m\]'
#PS1='[ \[\e[0;32m\]\u\[\e[m\] | \[\e[1;34m\]\W\[\e[m\] \[\e[3;32m\]$(__git_ps1 "(%s)") ] ☺\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[1;30m\].\[\e[m\]\[\e[0;37m\]\u\[\e[m\] \[\e[1;30m\]»\[\e[m\] \[\e[0;32m\]\W\[\e[m\]\[\e[1;33m\] $(__git_ps1 "(%s)")\[\e[m\]\[\e[3;32m\]☺\[\e[m\] \[\e[1;37m\]'

#PS1='\[\e[1;36m\]\h.\[\e[m\]\[\e[0;32m\]\W\[\e[m\]\[\e[1;33m\] $(__git_ps1 "(%s)")\[\e[m\]\[\e[3;32m\]¯\_(ツ)_/¯ \[\e[m\]\[\e[1;37m\]'
PS1='\[\e[1;36m\]\h.\[\e[m\]\[\e[0;32m\]\W\[\e[m\]\[\e[1;33m\] $(__git_ps1 "(%s)")\[\e[m\]\[\e[3;32m\](╯°□°）╯︵ ┻━┻) \[\e[m\]\[\e[1;37m\]'
#git line - standalone
#PS1='$(__git_ps1 "(%s)")'

################################################################################
#Aliases
if [ -f $HOME/.aliases ]; then
  source ~/.aliases
fi

#linux
function encrypt() { openssl aes-256-cbc -salt -in $1 -out $2; }
function decrypt() { openssl aes-256-cbc -d -salt -in $1 -out $2; }

alias di='docker images'

alias de='git push $1 --force --no-verify'
alias dps='docker ps'
alias dri='docker run -dt $1'

#rails
alias rr="rake routes | grep $1"

#ig
alias clearrediscache='redis-cli -p  6379 -n 2 keys "*" | xargs redis-cli -p 6379 -n 2 del $1'
alias fs='foreman start && passenger stop'

alias mpc='mpc -h abed'
alias mpd='mpd /etc/mpd.conf --no-daemon'
alias scs='screen -S $1'
alias sr='screen -x $1'
alias sls='screen -ls'
function sd() { screen -X -S $1 quit; }

alias tmux='TERM=screen-256color-bce tmux'
alias ts='TERM=screen-256color-bce tmux new -s $1'
#alias tr='tmux at -d -t $1'
alias td='tmux attach -d' #not tested with multiple sessions
alias tls='tmux ls'

alias ob='vim $HOME/.bashrc'
alias sb='source $HOME/.bashrc'

alias fp='ps aux -ww | ag $1'

#Color ls
alias ls='ls -G'

#list directories by size
alias qdu='du -h -d 1 . | sort -n -r'

alias removedbconflicts="find . -name \*\'s\ conflicted\ copy\ \* -exec rm -rf {} \;"

################################################################################

################################################################################
#Git stuff
function gc() { git add . && git add -u . && git commit -am"$*"; }
function gca() { git commit --amend -m"$*"; }
alias gp='git push -u'
alias gd='git diff'
alias gds='git diff --staged'

alias gi='git log --use-mailmap --all --oneline --color --decorate'
alias gg='git log --pretty=format:"%h %ad | %s%d [%aN]" --graph --date=short --decorate'
alias glo='git log --use-mailmap --oneline --no-merges master..'
alias gco='git checkout $1'
alias gcl='git clone $1'
alias gm='git checkout master'
alias gb='git branch'
alias gprune='git remote prune origin'
alias gct='git checkout --theirs $1'
function track() {
  git branch --set-upstream-to=$1
}
function gss() { git stash save "$*"; }
alias gsl='git stash list'
alias gpf='git push --force'
function gri() { git rebase -i HEAD~${1}; }
alias grhh='git reset --hard HEAD'
alias grsh='git reset --soft HEAD^'
function gsr() { git diff stash@{${1}}; }
function gsa() { git stash apply stash@{"$*"}; }
function gsp() { git stash pop stash@{"$*"}; }

function gst() { git checkout --theirs "$1" && git add "$1"; }

alias gu='git diff --name-only --diff-filter=U'

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

if [ "command -v DNSSD" ]; then
  alias listbonjourservers="dns-sd -B _afpovertcp._tcp ."
fi

alias removepycache='find . -type d -name '__pycache__' -exec rm -rf {} +'

#kube
alias kde='kubectl get deployments'
alias kded='kubectl describe deployment $1'

alias ks='kubectl get services --all-namespaces'
alias kds='kubectl describe service $1'

alias kp='kubectl get pods'
alias kdp='kubectl describe pod'

alias ki='kubectl get ingress'

alias ka='kubectl apply -f $1'
alias kc='kubectl create -f $1'
alias kd='kubectl delete -f $1'
function kl() { kubectl logs -f "$1"; }
function ke() { kubectl exec "$1" -i -t -- sh; }
function kdeletepod() { kubectl delete pod "$1" --grace-period=0 --force; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export ERL_AFLAGS="-kernel shell_history enabled"

complete -C /usr/bin/terraform terraform
# . /opt/asdf-vm/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

alias dockercleanimages='docker image prune -f;docker rm $(docker ps -q -f status=exited);docker volume rm $(docker volume ls -qf dangling=true);docker rmi $(docker images --filter "dangling=true" -q --no-trunc);sudo docker system prune -a -f'
#source /opt/anaconda2/bin/activate root

export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# pnpm
export PNPM_HOME="/home/m/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export NODE_OPTIONS="--max-old-space-size=4096"
export PATH="$HOME/.cargo/bin:$PATH"

# Cross-platform pbcopy alias
if command -v pbcopy &>/dev/null; then
  alias pbcopy='pbcopy'   # macOS or any system that already has it
elif command -v wl-copy &>/dev/null; then
  alias pbcopy='wl-copy'  # Wayland (Linux)
elif command -v xclip &>/dev/null; then
  alias pbcopy='xclip -selection clipboard'  # X11 (Linux)
elif command -v xsel &>/dev/null; then
  alias pbcopy='xsel --clipboard'  # fallback
else
  echo "Warning: no clipboard tool found for pbcopy alias." >&2
fi
