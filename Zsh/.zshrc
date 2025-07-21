# ============== PATH ==============

export PATH="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:$PYTHON_SHARE:$PATH"
export PATH=$PATH:/Users/robertyang/.rvm/gems/ruby-2.0.0-p247/bin:/Users/robertyang/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/robertyang/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/robertyang/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin::/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin
export PATH="$HOME/.rbenv/bin:$PATH"
# export ANDROID_HOME=/Users/$USER/Library/Android/sdk
# export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/share/npm/bin/
export PATH=$PATH:/usr/local/bin/vim
export PATH=$PATH:/usr/local/bin/rg
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/.deno/bin
export PATH=$PATH:/usr/local/opt/postgresql@12/bin/
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:~/Documents/Repos/Configs/Zsh/scripts
export PATH=$PATH:~/.tmux/scripts/t
export PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin
export PATH=$PATH:/usr/local/bin/node-jxa
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.rover/bin
export PATH=$PATH:~/Documents/Repos/Configs/scripts/bin

# Added by the Heroku Toolbelt
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/opt/homebrew/bin/:$PATH"

# Other ENVs
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export OSA_LIBRARY_PATH=~/Library/Script\ Library
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export KUBE_EDITOR="nvim"
export WEMI_PRIVATE_KEY=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
export HASURA_GRAPHQL_ADMIN_SECRET=asdjfq4wjr8

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
alias vim="nvim"
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
  # autojump
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

# 1password
eval "$(op completion zsh)"; compdef _op op

# ============== REPLACMENTS ============
alias ls='eza'

# ============== TMUX ==============
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/
DISABLE_AUTO_TITLE=true

alias tm="tmux new-session -A -s main"

# ============== NEOVIM ============== 
alias chv='change-host-value'

# ============== SUBLIME ==============

# alias nano="subl"
# alias e="subl"
export EDITOR="nvim"

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
alias grbro='delete-git-commit'
alias vimdiff='lvim -d'

bindkey -s ^o '$(fzf-git-branch)\n'

# Opens git config file
alias gconf='e ~/.gitconfig'

# Lazy Git
alias lzg='lazygit'

# ========= GITHUB ==========
function genssh {
  echo "Input email address:"
  read email
  while [ "$email" = "" ]
  do
    echo "Input email address:"
    read email
  done
    
  cd $HOME/.ssh
  ssh-keygen -t ed25519 -C $email
  cd -
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
alias dhin='dhi_neat'

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

# Lazy Docker
alias lzd='lazydocker'

# ========= k8s =========

alias kbv='kubernetes-verify-pod'
# alias k9s="k9s --readonly" # avoid making terrible mistakes on k8s
alias pr="kubectl get deployments --context=hou-dev --namespace=web-pr"

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
# alias yyb="nvm use && yarn && yarn build && notify -title $(basename $PWD) -subtitle $( git branch --show-current) -message 'yarn build' -group $( git branch --show-current)"
# alias yw="yarn watch"
# alias ddb="dcdown && dcb && dcup -d && notify -title $(basename $PWD) -subtitle $( git branch --show-current) -message 'docker-compose up -d' -sound 'default' -group $( git branch --show-current)"

# make_notify() {
#   make $1 && notify -title $(basename $PWD) -subtitle $(git branch --show-current) -message "make $1" -sound 'default' -group $(git branch --show-current)
# }
# alias make="make_notify"

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

# if alias aws >/dev/null 2>&1; then
#   unalias aws
#   AWS_BIN=$(which aws)
# fi
# alias aws="aws_cli_mfa_ensure_session && $AWS_BIN"

# ============ FFMPEG ============
alias tvid='trim-vid'

# ============ FLIGHTAWARE ============
alias hopnu="ssh -A hopnu.den.flightaware.com"
alias gogan="ssh -A gogan.den.flightaware.com"
alias nuxly="ssh -A nuxly.den.flightaware.com"
alias campa="ssh -A campa.den.flightaware.com"
alias baats="ssh -A baats.den.flightaware.com"
alias dev="ssh -A robyang.devenv.d.den.flightaware.com"

alias prune="gfa && git remote prune origin"

prerelease() {
  while true; do
    echo "Choose an action:"
    echo "1) New pre-release"
    echo "2) Existing pre-release"
    echo -n "Enter a number: "
    read action

    case $action in
      1)
        while true; do
          echo "Choose a version type to bump:"
          echo "1) major"
          echo "2) minor"
          echo "3) patch"
          echo -n "Enter a number: "
          read version_type

          case $version_type in
            1) version_type="major"; break ;;
            2) version_type="minor"; break ;;
            3) version_type="patch"; break ;;
            *) echo "Invalid option. Please enter 1, 2, or 3." ;;
          esac
        done

        echo -n "Enter a preid: "
        read preid

        # Constructing the dynamic version bump command
        npm version pre$version_type --preid "$preid"

        echo -n "Enter a tag name: "
        read tag_name

        npm publish --tag "$tag_name"

        # Display the final version number
        final_version=$(node -p "require('./package.json').version")
        echo "Process completed. Final version: $final_version"
        break
        ;;

      2)
        # Capture the old version number
        old_version=$(node -p "require('./package.json').version")

        # Increment the existing pre-release version
        npm version prerelease > /dev/null

        # Capture the new version number
        new_version=$(node -p "require('./package.json').version")

        # Display only the transition from old to new version
        echo "$old_version => $new_version"

        # Prompt for a tag to publish as
        echo "Choose a tag to publish as, or provide a new tag name:"

        # Fetch existing tags from the codebase
        existing_tags=()
        while IFS= read -r tag; do
          existing_tags+=("$tag")
        done < <(git tag)

        if [ ${#existing_tags[@]} -eq 0 ]; then
          echo "No existing tags found. You must enter a new tag name."
        else
          for i in "${!existing_tags[@]}"; do
            index=$((i + 1)) # zsh-compatible increment
            echo "$index) ${existing_tags[i]}"
          done
        fi

        echo -n "Enter an option or a new name: "
        read tag_input

        if [[ $tag_input =~ ^[0-9]+$ && $tag_input -le ${#existing_tags[@]} && $tag_input -gt 0 ]]; then
          # Ensure the array index is valid before accessing
          tag_name="${existing_tags[$((tag_input - 1))]}"
        elif [[ -n $tag_input ]]; then
          # Use input as the new tag name if it’s not empty
          tag_name="$tag_input"
        else
          echo "Invalid input. Exiting."
          break
        fi

        npm publish --tag "$tag_name"
        echo "Published with tag: $tag_name"
        break
        ;;

      *)
        echo "Invalid option. Please enter 1 or 2." ;;
    esac
  done
}

update() {
    # Check if we're in a git repository
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "❌ Not in a git repository"
        return 1
    fi

    # Get current branch name
    current_branch=$(git branch --show-current)
    
    echo "🔄 Starting update process..."
    echo "📍 Current branch: $current_branch"

    # Fetch latest changes from remote
    echo "📥 Fetching latest changes..."
    git fetch origin

    # Function to check if package files changed
    package_files_changed() {
        git diff --name-only "$1" "$2" | grep -q '^package\.\(json\|lock\.json\)$'
    }

    # Check if we're on main branch
    if [[ "$current_branch" == "main" ]]; then
        echo "✅ Already on main branch"
        
        # Check what changed before pulling
        old_head=$(git rev-parse HEAD)
        
        # Pull latest changes on main
        echo "⬇️  Pulling latest changes..."
        git pull origin main
        
        # Check if package files changed and run npm install if needed
        if [[ -f "package.json" ]] && package_files_changed "$old_head" "HEAD"; then
            echo "📦 Package files changed - running npm install..."
            npm install
        elif [[ -f "package.json" ]]; then
            echo "📦 No package changes - skipping npm install"
        fi
        
    else
        echo "🔀 Switching to main branch..."
        
        # Check for uncommitted changes
        if ! git diff-index --quiet HEAD --; then
            echo "⚠️  You have uncommitted changes. Please commit or stash them first."
            return 1
        fi
        
        # Switch to main and pull
        git checkout main
        
        # Check what changed before pulling on main
        old_main_head=$(git rev-parse HEAD)
        
        echo "⬇️  Pulling latest changes on main..."
        git pull origin main
        
        # Switch back to original branch and merge main
        echo "🔀 Switching back to $current_branch..."
        git checkout "$current_branch"
        
        echo "🔄 Merging main into $current_branch..."
        git merge main
        
        # Run npm install after merging if package files changed
        if [[ -f "package.json" ]] && package_files_changed "$old_main_head" "origin/main"; then
            echo "📦 Package files changed - running npm install..."
            npm install
        elif [[ -f "package.json" ]]; then
            echo "📦 No package changes - skipping npm install"
        fi
    fi

    echo "🎉 Update process completed successfully!"
    
    # Show current status
    echo "📊 Current status:"
    echo "   Branch: $(git branch --show-current)"
    echo "   Latest commit: $(git log -1 --oneline)"
}

# ============ DATABASE ============
# Open connection to prod asdidata.
alias asdidata="psql -U ryang -h asdidata-1.db.flightaware.com asdidata"

# Open connection to prod global_beacon.
alias akeem="psql -U ryang -d global_beacon -h akeem"

# Open connection to dev asdidata.
alias kozvo="psql ryang -d asdidata -h kozvo"
alias chken="psql ryang -d asdidata -h chken"

# ============ SSH =============
# Requires https://github.com/wwalker/ssh-find-agent
emulate ksh -c "source ~/Documents/Repos/ssh-find-agent/ssh-find-agent.sh"
ssh-find-agent -a
if [ -z "$SSH_AUTH_SOCK" ]
then
   eval $(ssh-agent) > /dev/null
   ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi

# ============= LOCAL DEVELOPMENT ================
# Run reverse proxy
alias rproxy="local-ssl-proxy --key ~/.ssl/_wildcard.flightaware.com-key.pem --cert ~/.ssl/_wildcard.flightaware.com.pem --source 443 --target"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ============== MUST BE AT END OF FILE ===================
eval "$(zoxide init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/rob.yang/.cache/lm-studio/bin"
