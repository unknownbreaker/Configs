# ============== PATH ==============

export PATH="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:$PYTHON_SHARE:$PATH"
export PATH=$PATH:/Users/robertyang/.rvm/gems/ruby-2.0.0-p247/bin:/Users/robertyang/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/robertyang/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/robertyang/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin::/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export PATH="$HOME/.rbenv/bin:$PATH"
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/share/npm/bin/
export PATH=$PATH:/usr/local/bin/vim
export PATH=$PATH:/usr/local/bin/rg
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/.deno/bin
export PATH=$PATH:/usr/local/opt/postgresql@12/bin/
export PATH=$PATH:/usr/local/bin/limelight
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:~/.config/nvim/scripts/change-host-value
export PATH=$PATH:~/Documents/Repos/Configs/Zsh/scripts
export PATH=$PATH:~/.tmux/scripts/t
export PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin
export PATH=$PATH:/usr/local/bin/node-jxa
export PATH=$PATH:~/.local/bin

# Added by the Heroku Toolbelt
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/opt/homebrew/bin/:$PATH"

# Other ENVs
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export OSA_LIBRARY_PATH=~/Library/Script\ Library
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export KUBE_EDITOR="open -a \"lvim\" --wait"

# brew
alias brew86="arch -x86_64 /usr/local/homebrew/bin/brew"

# nvm
export NVM_DIR=~/.nvm
[ -s "/usr/local/homebrew/opt/nvm/nvm.sh" ] && \. "/usr/local/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# kcli
export PATH=$PATH:~/Documents/Repos/Kargo/kcli-codebase

# ============== APPLICATION ASSIGNMENTS ==============

alias vsc="'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'"
alias vscode='vsc'
# alias vim="nvim"
# alias vi="nvim"

# ============== OH MY ZSH ==============

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# load zsh moving function
autoload -U zmv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rob"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# To quickly edit my zshrc profile
alias bp='vim ~/.zshrc'

# Disable autoupdate prompt
DISABLE_UPDATE_PROMPT=true

alias reload='source ~/.zshrc'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="false"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  aliases
  autojump
  aws
  colored-man-pages
  dirhistory
  docker
  docker-compose
  fzf-zsh-plugin
  git
  gitfast
  history
  kubectl
  minikube
  macos
  ripgrep
  safe-paste
  taskwarrior
  tmux
  vi-mode
  # z
  # zsh-autocomplete
  zsh-autosuggestions
  # zsh-interactive-cd
  zsh-syntax-highlighting
)

# Automatic update without confirmation prompt
# zstyle ':omz:update' mode auto
# This will check for updates every 1 days
# zstyle ':omz:update' frequency 0

source $ZSH/oh-my-zsh.sh

# Remove zcompdump file which interferes with autocomplete
# rm ~/.zcompdump*

# Increase history size
HISTFILE=~/.zsh_history
HISTFILESIZE=10000000
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# ============== PLUGINS CONFIGS
ZSH_ALIAS_FINDER_AUTOMATIC=true

# Turn off the auto "cd" for directories
unsetopt AUTO_CD

bindkey "^ " autosuggest-accept

# ============== TMUX ==============
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/
DISABLE_AUTO_TITLE=true

# ============== NEOVIM ============== 
alias chv='bash ~/.config/zsh/scripts/change-host-value'

# ============== SUBLIME ==============

# alias nano="subl"
# alias e="subl"
export EDITOR="lvim"

# ============== NOTIFIER ==============
alias notify="terminal-notifier"

# ============== NAVIGATION ==============

alias cd..="cd .."
alias cd/='cd /'
alias desktop='cd ~/Desktop'
# alias ll='ls -halF'
# alias lsa='ls -a'
# alias ls='ls -FGh'
alias b='bundle install'
alias f='open -a Finder ./'
alias clear="clear && printf '\e[3J'"

function g() {

}

# Make a directory and "cd" into it.
function mcd() {
  mkdir -p "$1" && cd "$1"
}

# cd's into the frontmost window in macos finder
function cdf() {
  currFolderPath=$( /usr/bin/osascript <<EOT
    tell application "Finder"
      try
    set currFolder to (folder of the front window as alias)
      on error
    set currFolder to (path to desktop folder as alias)
      end try
      POSIX path of currFolder
    end tell
EOT
    )
echo "cd to \"$currFolderPath\""
cd "$currFolderPath"
}

# ============== GIT ALIASES ==============

alias gl="git log"
alias gll="git log --pretty=format:'%C(yellow)%h%Creset - %C(brightwhite)%s%Creset %C(green)(%aD)%Creset - %C(brightblue)%an%Creset'"
alias glll="git log --pretty=format:'%C(yellow)%h%Creset - %s %C(green)(%aD)%Creset - %C(brightblue)%an%Creset%n%n%w(64,4,4)%b%n%-C()%n'"
alias gs="git status"
alias gb="git branch"
# alias gb="fzf-git-branch"
alias gba="git branch -a"
alias ga='git add'
alias gap='git add -p'
alias gr='git rm'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
# alias gco='fzf-git-checkout'
alias gcom='git checkout master'
alias gcof='git checkout $(git branch | fzf)'
alias gp='git push'
alias gpo='git push origin'
alias gpfo='git push -f origin'
alias glpfa='git log --pretty=format:"%s (%h)"'
alias gf='git fetch'
alias gfa='git fetch origin "+refs/heads/*:refs/remotes/origin/*"'
alias gw='git worktree'
alias gwa='git worktree add'
alias gwr='git worktree remove'
alias gwrf='git worktree remove --force'
alias gwm='git worktree move'
alias gwp='git worktree prune'

alias vimdiff='nvim -d'

bindkey -s ^o '$(fzf-git-branch)\n'

# Delete a commit
function grbro {
  local commit=$1;
  git rebase --rebase-merges --onto $1^ $1
}

# Opens git config file
alias gconf='e ~/.gitconfig'

# Clones a repo, CDs into it, opens it in Sublime, and runs bundle. From: https://github.com/stephenplusplus/dots/blob/master/.bash_profile
function clone {
  local url=$1;

  if [[ ${url:0:4} == 'http' || ${url:0:3} == 'git' ]]
  then
    # just clone this thing.
    repo=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  fi

  git clone $url && cd $repo
}

function fzf-git-branch() {
  git rev-parse HEAD > /dev/null 2>&1 || return

  git branch --color=always --all --sort=-committerdate |
    grep -v HEAD |
    fzf --height 50% --ansi --no-multi --preview-window right:65% \
      --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}

fzf-git-checkout() {
  git rev-parse HEAD > /dev/null 2>&1 || return

  local branch

  branch=$(fzf-git-branch)
  if [[ "$branch" = "" ]]; then
    echo "No branch selected."
    return
  fi

  # If branch name starts with 'remotes/' then it is a remote branch. By
  # using --track and a remote branch name, it is the same as:
  # git checkout -b branchName --track origin/branchName
  if [[ "$branch" = 'remotes/'* ]]; then
    git checkout --track $branch
  else
    git checkout $branch;
  fi
}

# ========= Postgres =========

alias psql='psql -h localhost'

# ============== DOCKER ==============
# Docker Compose #
alias dco='docker compose'

alias dcb='docker compose build'
alias dce='docker compose exec'
alias dcps='docker compose ps'
alias dcrestart='docker compose restart'
alias dcrm='docker compose rm'
alias dcr='docker compose run'
alias dcstop='docker compose stop'
alias dcup='docker compose up'
alias dcdown='docker compose down'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'


# Images #

alias di='docker images'
alias drmi='docker rmi'
alias dbu='docker build'
alias drmi_all='docker rmi $* $(docker images -a -q)'
alias drmi_dang='docker rmi $* $(docker images -q -f "dangling=true")'
alias dhi='docker history $*'
dhi_neat() {
  ### dhi_neat <image name> [extra `docker history` options]
  docker history "${1}" \
    --format "{{ .Size }}\t{{ .CreatedBy }}" \
    ${2:-} |
    sort \
      --key=1 \
      --human-numeric-sort \
      --reverse
}

# Containers #

alias dps='docker container ls --all --format "table {{.Names}}\t{{.Status}}" | sort'
alias drit='docker run -it'
alias deit='docker exec -it'
alias dlog='docker logs'
alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $*'
alias dhelp='docker help'
alias dstart='docker container start'
alias dstop='docker stop'
alias dkill='docker kill'
alias dstop_all='docker stop $* $(docker ps -q -f "status=running")'
alias drm='docker rm'
alias drm_stopped='docker rm $* $(docker ps -q -f "status=exited")'
alias drmv_stopped='docker rm -v $* $(docker ps -q -f "status=exited")'
alias drm_all='docker rm $* $(docker ps -a -q)'
alias drmv_all='docker rm -v $* $(docker ps -a -q)'

# Volumes #
alias dvls='docker volume ls $*'
alias dvrm_all='docker volume rm $(docker volume ls -q)'
alias dvrm_dang='docker volume rm $(docker volume ls -q -f "dangling=true")'

# Nuclear option #
alias dprune='docker system prune -a --volumes'

# ========= k8s =========


# Refer here to see aliases: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl

function kbverify() {
  namespaces=(
    ad-demo-platform
    ad-demo-platform-v2
    ad-demo-platform-dev
    ad-composer
    ad-composer-dev
    ad-krab
    ad-snippet-service
    ad-snippet-service-dev
    ad-snippet-service-staging
    cat-team-dev
    kats-service
    video-tag-builder
    video-tag-builder-dev
  )
  kubectl -n $(printf '%s\n' "${namespaces[@]}" | fzf) get pods 
}

alias k9s="k9s --readonly" # avoid making terrible mistakes on k8s

# ========= RUBY =========

# [[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"


eval "$(rbenv init -)"

# Initialize rbenv

# rbenv global 2.3.4
# export RBENV_VERSION=1.9.3-p484

# Fix Ruby server for High Sierra and Mojave
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# For my Ruby programs
alias be="bundle exec"
alias console="be rake console"
alias boom='be rake db:drop; be rake db:create && be rake db:migrate'
alias seed='be rake db:drop; be rake db:create && be rake db:migrate && be rake db:seed'
alias booms='be rake db:drop; be rake db:create && be rake db:migrate && rails s'
alias seeds='be rake db:drop; be rake db:create && be rake db:migrate && be rake db:seed && rails s'

# ========= NODE =========

# eval "$(nodenv init -)"

# ========= ANDROID EMULATOR FOR LOCAL SERVER DEBUG =========
# remounts emulator to allow for briefly pushing a custom hosts file
# must run this every time if want to view local server
alias mkandroid='adb root && adb -s emulator-5554 remount && adb -s emulator-5554 push ~/Documents/Configs/Android/hosts /system/etc/hosts'

function startandroid {
  # (@) start-android
  # If the emulator command exists on this device, displays a list of emulators
  # and prompts the user to start one

  # Check if the emulator command exists first
  if ! type emulator > /dev/null; then
    echo "emulator command not found"
    exit 1
  fi

  # Gather emulators that exist on this computer
  DEVICES=( $(emulator -list-avds 2>&1 ) )

  # Display list of emulators
  echo "Available Emulators
  ----------------------------------------"
  N=1
  for DEVICE in ${DEVICES[@]}
  do
    echo "$N) $DEVICE"
    let N=$N+1
  done

  # Request an emulator to start
  read "?
  Choose an emulator: " num

  # If the input is valid, launch our emulator on a separate PID and exit
  if [ $num -lt $N ] && [ $num -gt 0 ];
  then
    DEVICE=${DEVICES[$num]}
    # cd ~/Library/Android/sdk/tools && emulator -writable-system "@$DEVICE" -http-proxy "$(ipconfig getifaddr en0)":8888 &
    cd ~/Library/Android/sdk/tools && emulator -writable-system "@$DEVICE" & 
    cd -
    mkandroid &
  else
    echo "Invalid Entry : $num"
    exit 1
  fi
}

# ======= SCRUM NOTES =======

function scrum() {
  stringDate=0
  if [ $1 ]; then
    stringDate=$1
  else
    stringDate=$(date +%Y%m%d)
  fi
  filename=scrum$stringDate.md

  scrum_line="$(date +%A), $(date +%b) $(date +%d), $(date +%Y)\n"
  scrum_line+="= PREVIOUSLY =\n\n"
  scrum_line+="= TODAY =\n\n"
  scrum_line+="= AFTER TALKS =\n\n"
  scrum_line+="= BLOCKERS =\n\n"
  scrum_line+="= ANSWERS / UPDATES =\n\n"
  scrum_line+="= WFH / OOO / Offline =\n\n"
  scrum_line+="= FOR MY OWN RECORDS =\n\n"
  scrum_line+="= CONVERSATIONS / MEETINGS =\n"

  total="$scrum_line"

  if [ -f $filename ]; then
    scrum $(date -j -f %Y%m%d -v+1d "$stringDate" +%Y%m%d)
  elif [ $(date -j -f %Y%m%d $stringDate +%A) == Sunday ]; then
    scrum $(date -j -f %Y%m%d -v+1d "$stringDate" +%Y%m%d)
  elif [ $(date -j -f %Y%m%d $stringDate +%A) == Saturday ]; then
    scrum $(date -j -f %Y%m%d -v+2d "$stringDate" +%Y%m%d)
  else
    echo $total > scrum$stringDate.md && echo "scrum$stringDate.md has been created"
  fi
}



# ======== CHROME =====
alias chrome="open /Applications/Google\ Chrome.app/ --args --disable-web-security --allow-file-access --allow-cross-origin-auth-prompt"
alias testchrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=~/Documents/Repos/Work/Chrome-Isolated"

# ======== FZF ========

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Setting fd as the default source for fzf
# follow symbolic links, and include hidden files
# export FZF_DEFAULT_COMMAND="fd . $HOME"

# export FD_OPTIONS="--follow --hidden --exclude .git --exclude node_modules"
# export FZF_DEFAULT_OPTS1="--layout=reverse --inline-info"

# Bind C-u to pageup and C-d to pagedown
# export FZF_DEFAULT_OPTS2='--bind ctrl-d:page-down,ctrl-u:page-up'

# To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Make ALT-C find directory
# export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS $FZF_DEFAULT_OPTS1 $FZF_DEFAULT_OPTS2 $FZF_DEFAULT_COMMAND"

bindkey -s ^f "tmux-sessionizer\n"

export EMACS="*term*"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/robertyang/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/robertyang/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/robertyang/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/robertyang/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# KARGO base-infrastructure setup
if [ -f /Users/robertyang/Documents/Repos/Kargo/base-infrastructure/env.sh ]; then
  source /Users/robertyang/Documents/Repos/Kargo/base-infrastructure/env.sh
fi

# - - - - - - News
alias getnews='open "https://news.ycombinator.com"; \
  open "https://adexchanger.com"; \
  open "https://hn.algolia.com/?dateRange=last24h&page=0&prefix=false&query=typescript&sort=byPopularity&type=story"; \
  open "https://hn.algolia.com/?dateRange=last24h&page=0&prefix=false&query=javascript&sort=byPopularity&type=story"; \
  open "https://hn.algolia.com/?dateRange=pastWeek&page=0&prefix=true&query=%22ad%22&sort=byPopularity&type=story"; \ 
  open "https://hn.algolia.com/?dateRange=pastWeek&page=0&prefix=true&query=security&sort=byPopularity&type=story"'
# - - - - - - News

# Upgrade all 
alias brewall='brew update; brew upgrade; brew doctor'
export PATH=$HOME/bin:$PATH

# ============= KARGO ==============
bindkey -s ^p "go-to-kat-project\n"
function go-to-kat-project() {
  kat_projects
}

# bindkey -s ^p "z $(find ~ ~/Documents/Repos/Kargo/*.git/ ~/Documents/Repos/Kargo/*.git/kat-* -maxdepth 0 -type d | fzf)\n"

# Auto-load the nvm use for any repo with .nvmrc file
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  local is_old_repo="false"

  if [[ "$nvmrc_path" = *"/ad-tag"* ]] \
    || [[ "$nvmrc_path" = *"/ad-snippet-service"* ]] \
    || [[ "$nvmrc_path" = *"/ad-kailtra"* ]] \
    || [[ "$nvmrc_path" = *"/ad-kargonaut"* ]]; then
    is_old_repo="true"
  fi

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [[ "$is_old_repo" = "true" ]]; then
      nvm use v16.15
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

alias yyb="load-nvmrc && yarn && yarn build && notify -title $(basename $PWD) -subtitle $(git branch --show-current) -message 'yarn build' -group $(git branch --show-current)"
alias yw="yarn watch"
alias ddb="dcdown && dcb && dcup -d && notify -title $(basename $PWD) -subtitle $(git branch --show-current) -message 'docker-compose up -d' -sound 'default' -group $(git branch --show-current)"

make_notify() {
  make $1 && notify -title $(basename $PWD) -subtitle $(git branch --show-current) -message 'make $1' -sound 'default' -group $(git branch --show-current)
}
alias make="make_notify"

alias mail="nvim /var/mail/$(whoami)"

# ============= AWS ===============
# If you have any trouble using this, then ask about it in #devops-requests.
#
# This script must be SOURCED. It won't work if you just run it. When you
# export a variable or set an alias, it's only available in subprocesses. When
# you RUN a script, it gets a new process, so an export or alias isn't visible
# to the parent process.
#
# source aws_cli_mfa.sh
#
# You can add that to your .bashrc or .zshrc. When you run an aws command,
# you'll be prompted once a day for an MFA code.

AWS_BIN=$(which aws)

aws_cli_mfa_ensure_session() {
    session_store="$HOME/.aws/aws_cli_mfa_session.json"
    modified=
    expiration=
    case "$(uname -s)" in
        Linux)
        modified=$(stat --format %Y "$session_store" 2>/dev/null || echo 0)
        expiration=$(date --date '-1 day' +%s)
        ;;
        Darwin)
        modified=$(stat -f %m "$session_store" 2>/dev/null || echo 0)
        expiration=$(date -v-1d +%s)
        ;;
        *)
        >&2 echo "aws_cli_mfa.sh: I am not sophisticated and I have no idea what OS you're using."
        ;;
    esac

    if [[ "$modified" -lt "$expiration" ]]; then
        if [[ $SHELL == *"zsh" ]]; then
            read "?aws_cli_mfa.sh: Give me an AWS MFA code: " mfa_code
        else
            read -p "aws_cli_mfa.sh: Give me an AWS MFA code: " mfa_code
        fi
        unset AWS_ACCESS_KEY_ID
        unset AWS_SECRET_ACCESS_KEY
        unset AWS_SESSION_TOKEN
        echo "aws_cli_mfa.sh: Starting your session. It will be stored in $session_store."
        (outpoot="$(
            "$AWS_BIN" sts get-session-token \
            --serial-number "$("$AWS_BIN" iam get-user | jq -r .User.Arn | sed 's_:user/_:mfa/_')" \
            --token-code "$mfa_code" \
            --duration-seconds 129600
        )" && echo "$outpoot" > "$session_store") || \
        >&2 echo "aws_cli_mfa.sh: That didn't work. Try sourcing this script again."
    fi

    if [[ -f "$session_store" ]]; then
      while read id secret token _; do
        export AWS_ACCESS_KEY_ID="$id"
        export AWS_SECRET_ACCESS_KEY="$secret"
        export AWS_SESSION_TOKEN="$token"
      done < <(jq -r '.Credentials | .AccessKeyId + " " + .SecretAccessKey + " " + .SessionToken' "$session_store")
    fi
}

alias aws="aws_cli_mfa_ensure_session && $AWS_BIN"

# ============ FFMPEG ============
trimvid() {
  input_file=$1
  silence_length=$2
  output_file$3

  ffmpeg -i $1 -hide_banner -af silencedetect=n=-50dB:d=$2 -f null – 2>&1 | python remsi.py > $3 && \
    sh -e $3 && \
    rm $3
}
