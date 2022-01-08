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

# Added by the Heroku Toolbelt
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH="/usr/local/heroku/bin:$PATH"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

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
  alias-finder
  aws
  colored-man-pages
  docker
  docker-compose
  fancy-ctrl-z
  fzf
  git
  gitfast
  history
  minicube
  osx
  ripgrep
  safe-paste
  tmux
  vi-mode
  z
  zsh-autosuggestions
  zsh-navigation-tools
  zsh-syntax-highlighting
)
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

bindkey "^ " autosuggest-accept

# ============== TMUX ==============
DISABLE_AUTO_TITLE=true

# ============== SUBLIME ==============

# alias nano="subl"
# alias e="subl"
export EDITOR="nvim"

# ============== NAVIGATION ==============

alias cd..="cd .."
alias cd/='cd /'
alias desktop='cd ~/Desktop'
alias ll='ls -halF'
alias lsa='ls -a'
alias ls='ls -FGh'
alias b='bundle install'
alias f='open -a Finder ./'
alias clear="clear && printf '\e[3J'"

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
alias gcof='git checkout $(git branch | fzf)'
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

  if [[ ${url:0:4} == 'http' || ${url:0:3} == 'git' ]]
  then
    # just clone this thing.
    repo=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  fi

  git clone $url && cd $repo
}

# ========= Postgres =========

alias psql='psql -h localhost'


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



# ======== CHROME UNHINGED =====
alias chrome="open /Applications/Google\ Chrome.app/ --args --disable-web-security --allow-file-access --allow-cross-origin-auth-prompt"

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
