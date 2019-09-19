# ============== PATH ==============

export PATH="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:$PYTHON_SHARE:$PATH"
export PATH=$PATH:/Users/robertyang/.rvm/gems/ruby-2.0.0-p247/bin:/Users/robertyang/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/robertyang/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/robertyang/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin::/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export PATH="$HOME/.rbenv/bin:$PATH"
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/share/npm/bin/
export PATH=$PATH:/usr/local/bin/vim
export VAULT_ADDR="https://devkeys.disney.network"

# Added by the Heroku Toolbelt
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH="/usr/local/heroku/bin:$PATH"

# ============== APPLICATION ASSIGNMENTS ==============

alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias atom="'/Applications/Atom.app/Contents/MacOS/Atom'"

# ============== OH MY ZSH ==============

# load z plugin
. ~/z.sh

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
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# To quickly edit my zshrc profile
alias bp='e ~/.zshrc'

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
plugins=(git)
plugins=(osx)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ============== TMUX ==============
DISABLE_AUTO_TITLE=true

# ============== SUBLIME ==============

# alias nano="subl"
# alias e="subl"
export EDITOR="vi"

# ============== ATOM ==============

alias nano="subl"
alias e="subl"

# ============== NAVIGATION ==============

alias cd..="cd .."
alias cd/='cd /'
alias desktop='cd ~/Desktop'
alias ll='ls -halF'
alias lsa='ls -a'
alias ls='ls -FGh'
alias b='bundle install'
alias f='open -a Finder ./'

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

# ============== GIT SHORTCUTS ==============

alias gl="git log"
alias gs="git status"
alias gb="git branch"
alias gba="git branch -a"
alias ga='git add'
alias gap='git add -p'
alias gr='git rm'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcom='git checkout master'
alias gp='git push'
alias gpo='git push origin'
alias glpfa='git log --pretty=format:"%s (%h)"'

# Delete a commit
function gd {
  local commit=$1;
  git rebase -p --onto $1^ $1
}

# Opens git config file
alias gconf='e ~/.gitconfig'

# Clones a repo, CDs into it, opens it in Sublime, and runs bundle. From: https://github.com/stephenplusplus/dots/blob/master/.bash_profile
function clone {
  local url=$1;
  local repo=$2;

  if [[ ${url:0:4} == 'http' || ${url:0:3} == 'git' ]]
  then
    # just clone this thing.
    repo=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  elif [[ -z $repo ]]
  then
    # my own stuff.
    repo=$url;
    url="git@github.com:flamdoodle/$repo";
  else
    # not my own, but I know whose it is.
    url="git@github.com:$url/$repo.git";
  fi

  git clone $url $repo && cd $repo && subl . && bundle install;
}

# ========= Postgres =========

alias psql='psql -h localhost'


# ========= RUBY =========

# [[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"


eval "$(rbenv init -)"

# Initialize rbenv

rbenv global 2.3.4
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

eval "$(nodenv init -)"

# ========= MARVELKIDS =========
# this command shuts off zsh's bracket recognition
unsetopt nomatch
alias mktag='be rake matterhorn:release'
alias cdmk='cd ~/Documents/Repos/*/marvelkids'

function mk {
  local env=$1
  local net=$2

  if [[ ${env} == 'prod' ]]
  then
    if [[ ${net} == 'network' ]]
    then
      mtt_cms_api_uri=https://cms.matterhorn.disney.io/ be rackup -o "$(ipconfig getifaddr en0)" &
    else
      be rake s mtt_cms_api_uri=https://cms.matterhorn.disney.io/ &
    fi
  elif [[ ${env} == 'local' ]]
  then
    if [[ ${net} == 'network' ]]
    then
      mmtt_cms_api_uri=http://cms.local.diznee.net:3003/ be rackup -o "$(ipconfig getifaddr en0)" &
    else
      be rake s mtt_cms_api_uri=http://cms.local.diznee.net:3003/ &
    fi
  else
    if [[ ${net} == 'network' ]]
    then
      mtt_cms_api_uri=https://cms-$env.mh.disney.io/ be rackup -o "$(ipconfig getifaddr en0)" &
    else
      be rake s mtt_cms_api_uri=https://cms-$env.mh.disney.io/ &
    fi
  fi
}

function runmongo {
  if pgrep -x "mongod" > /dev/null
  then
    echo "Mongo is running"
  else
    mongod &
  fi
}

function mkcms {
  CURR_DIR=$(pwd)
  cd ~/Documents/Repos/Marvel/cms &&
  
  runmongo

  rails s -p 3003 -b 127.0.0.1 &
  open http://cms.local.diznee.net:3003

  if [ "$PWD" != CURR_DIR ]; then
    cd -
  fi
}

function mkcore {
  CURR_DIR=$(pwd)
  cd ~/Documents/Repos/Marvel/core &&

  runmongo

  rails s -p 3000 -b 127.0.0.1 &
  open http://core.local.diznee.net:3000

  if [ "$PWD" != CURR_DIR ]; then
    cd -
  fi
}

# ========= COMPANION APP =========
# QA JSON
alias jqa='curl -H "Authorization: GAE 29958746-a0f7-46c6-92c7-be6676a75d57" https://cms-qa.api.mh.disney.io/frontend/app.marvelhq.com/page.json\?path\=%2Fcompanion-app-games'
alias jprod='curl -H "Authorization: GAE 267d6fd8-2b52-4c73-a571-a7271edc6d77" https://cms.api.matterhorn.disney.io/frontend/app.marvelhq.com/page.json\?path\=%2Fcompanion-app-games'



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

# ========= QUBIT =========

# For setting up local experiments
alias xpgo='touch activation.js; touch execution.js; touch global.js; touch variation.css; e .; xp'

# ========= Browser functions =========

function gcal() {
  open https://calendar.google.com/
}

function gmail() {
  open https://mail.google.com/mail/u/0/#inbox
}

function exercise() {
  open https://docs.google.com/spreadsheets/d/1-DaDlRZLMR_HACPwl9rkfRj1T-SQ5tCWkOV0wQ4zThs/edit#gid=1996917032
}


# ========= PEBBLE SHORTCUTS =========
alias pebblego="pebble clean; pebble build; pebble install --emulator aplite; pebble logs"


# ========= VIM MODE =========
# Enable Vim keyboard shortcuts instead.
# set -o vi
bindkey -v

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# `v` is already mapped to visual mode, so we need to use a different key to
# open Vim
bindkey -M vicmd "^V" edit-command-line

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

# Use ripgrep
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fzf-history-widget-accept() {
fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============== ZSH AUTOSUGGESTIONS ==============
# Ctrl + Space
bindkey "^ " autosuggest-accept

# ======= SCRUM NOTES =======

function scrum() {
  stringDate=0
  if [ $1 ]; then
    stringDate=$1
  else
    stringDate=$(date +%Y%m%d)
  fi
  filename=scrum$stringDate.md

  scrum_line_a="$stringDate.md\n"
  scrum_line_b="# YESTERDAY / THIS MORNING ============================================\n\n"
  scrum_line_c="# FOR MY OWN RECORDS ============================================\n\n"
  scrum_line_d="# AFTER TALKS ============================================\n\n"
  scrum_line_e="# BLOCKERS ============================================\n\n"
  scrum_line_f="# ANSWERS / UPDATES ============================================\n\n"
  scrum_line_g="# TODAY ============================================\n\n"
  scrum_line_h="# WFH / OOO / Offline ============================================\n\n"
  scrum_line_i="# CONVERSATIONS / MEETINGS ============================================\n"

  total="$scrum_line_a$scrum_line_b$scrum_line_c$scrum_line_d$scrum_line_e$scrum_line_f$scrum_line_g$scrum_line_h$scrum_line_i"

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

# Remove zcompdump file which interferes with autocomplete
rm ~/.zcompdump*

# ======== CHROME UNHINGED =====
alias chrome="open /Applications/Google\ Chrome.app/ --args --allow-file-access --allow-cross-origin-auth-prompt"
