# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="half-life"
# ZSH_THEME="zsh2000"

# export ZSH_2000_DISABLE_RVM='true'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::rust
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
  web-search
  history
  kubectl
)

# TODO: This causes new terminals to always open at `cd`
# Let's pull out dotenvs repo to make sure we are up-to-date
cd ~/Documents/checkouts/svenjr/dotenvs && git pull -qf && cd

# Force git to use our .gitignore file here as global
# TODO: For some reason the symlink does not work
git config --global core.excludesfile ~/Documents/checkouts/svenjr/dotenvs/.gitignore

source $ZSH/oh-my-zsh.sh

# Load local ENVs which will not come to git
if [ -f ~/.env ]; then
    # Load Environment Variables
    set -o allexport; source ~/.env; set +o allexport
fi

export PATH=$PATH:/usr/local/bin:$PATH

# Go path
export PATH=$(go env GOPATH)/bin:$PATH

# Chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

# This exports the second path homebrew from M1 macs
export PATH="/opt/homebrew/bin:$PATH"

# Export path for ASDF
export PATH="$HOME/.asdf/shims:$PATH"

# Source Chruby and add magic lines
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

# Set up fzf key binding for fuzzy search
# source <(fzf --zsh)

######################### ALIASES #########################
# Aliases which use secret passwords loaded from .env
alias atlas-dev="psql postgres://$ATLAS_DEV_USER:$ATLAS_DEV_PASS@titicaca-development-atlas.$AWS_DEV_HOST:5432/atlas_production"

alias atlas-prod="psql postgres://$ATLAS_PROD_USER:$ATLAS_PROD_PASS@annency-production-atlas.$AWS_PROD_HOST:5432/atlas_production"

alias xenos-dev="psql postgres://$XEN_DEV_USER:$XEN_DEV_PASS@titicaca-development-xenos.$AWS_DEV_HOST:5432/xenos"

alias xenos-prod="psql postgres://$XEN_PROD_USER:$XEN_PROD_PASS@annency-production-xenos.$AWS_PROD_HOST:5432/xenos"

alias avy-dev="psql postgres://$AVY_DEV_USER:$AVY_DEV_PASS@tahoe-development-avalanche-bulletin.$AWS_DEV_HOST:5432/avalanche"

alias avy-prod="psql postgres://$AVY_PROD_USER:$AVY_PROD_PASS@arrowhead-production-avalanche-bulletin.$AWS_PROD_HOST:5432/avalanche"

alias users-prod="psql postgres://$USER_PROD_USER:$USER_PROD_PASS@annecy-production-users.$AWS_PROD_HOST:5432/users"

alias dwh="psql postgres://$DWH_USER:$DWH_PASS@titicaca-development-data-warehouse.$AWS_DEV_HOST/data_warehouse"

alias pissh="ssh 192.168.1.5"

alias paasage='~/Documents/checkouts/strava/configuration/mesos/tools/paasage'

# Other Aliases
# Kube contexts
alias awsume=". awsume"
alias m-mfa-engineering='awsume fatmap-default-engineering -o fatmap-default && awsume -u'
alias awsume-root="awsume fatmap-root-engineering"
alias awsume-pc="awsume fatmap-root-engineering --role-duration 3600"

# Strava
# AWS and kube
alias strava-sso="aws sso login --profile PowerUserAccess-200602884457"
alias strava-login="strava-sso && ~/Documents/checkouts/strava/configuration/mesos/tools/aws-login"

# Passage and Active
alias paasage='~/Documents/checkouts/strava/configuration/mesos/tools/paasage'
alias active-staging='paasage tasks --app-id active/staging/appserver shell'
alias active-prod='paasage tasks --app-id active/prod/appserver shell'

# Little arc window with search term on StartPage
# Usage: arc example search
alias arc='function _arc(){ arc-cli new-little-arc "https://www.startpage.com/sp/search?query=$(echo -n "$*" | sed "s/ /%20/g")&prfe=a74f607577f0385f78eb4fff745e994382b70cb29386c5fa0183ad4643ee777c335396e2f171b80547d91d7707bc94f7093651331005985ab3984e3d3593348b8c583ed34034793ed9"; };_arc'

# Open a new arc tab with the given org/repo name in a VS Code environment.
alias vsd='vsd() { arc-cli new-tab "https://github.dev/$1" };vsd'

alias cf='cf() { cd ~/Documents/checkouts/fatmap/"$1" };cf'
alias cs='cs() { cd ~/Documents/checkouts/strava/"$1" };cs'
alias csv='csv() { cd ~/Documents/checkouts/svenjr/"$1" };csv'

alias gcf='gcf() { cf && git clone https://github.com/FATMAP/"$1" };gcf'
alias gcs='gcs() { cs && git clone https://github.com/strava/"$1" };gcs'

alias dm="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

# Target neovim for vim
# alias vim=nvim

alias kcuc-dev='kubectl config set current-context platform-development'
alias kcuc-prod='kubectl config set current-context platform-production'
alias kcuc-pp='kubectl config set current-context prime-prod'
alias kcuc-ps='kubectl config set current-context prime-staging'
alias kcuc-mps='kubectl config set current-context map-platform-staging'
alias kcuc-mpp='kubectl config set current-context map-platform-production'

alias docker_kill_everything="sudo docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"

# Jump into the devops cotainer
alias k8s="sudo cd && cd ~/Documents/platform-config/ && make run"

# Open a vim editor for the rc
alias profile="cd && vim .zshrc"

# Resource the profile
alias resource="source ~/.zshrc"

#show me sizes of things in my current directory
alias sizes='sudo du -sh */ | sort -rh'

alias switch_psql_14='brew unlink postgresql && brew link postgresql'
alias switch_psql_13='brew link --overwrite postgresql@13'

alias sqs-grep='$HOME/sqs-grep'

alias git-cleanup="git fetch --prune && git branch --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" { print $1 }' | xargs -r git branch -D"

alias check-unsets='echo "Dev:" && kustomize build ./deploy/clusters/dev/platform-development | grep unset; echo "Prod:" && kustomize build ./deploy/clusters/prod/platform-production | grep unset'

# Bat theme config.
export BAT_THEME=tokyonight_moon

clear
echo -e "STATUS: \033[92mACTIVE\033[0m
Welcome :)

Some helpful tools:
  - arc [search]: open a little arc window to search startpage for something
  - vsd [user/repo]: open a VSCode dev window in arc to edit the repo online
  - cf [repo name]: cd to a FATMAP checkout repo locally
  - cs [repo name]: cd to a Svenjr checkout repo locally
  - sizes: get the size of things in the current directory
  - resource: re-source this RC file
  - profile: vim edit this RC file
  - kcuc-dev: dev k8s context
  - kcuc-prod: prod k8s context
  - k8s: jump into the platform-config container
  - google [search]: google search straight from the terminal
  - hs [search]: search your history for past commands with containing this term
  - dm: toggle dark mode on the system
  - strava-login: use the aws script in config to login to AWS and docker"
export AWS_CONFIG_FILE=$HOME/.aws/fatmap-config
alias fm-mfa-engineering='awsume fatmap-default-engineering -o fatmap-default && awsume -u'
alias fm-mfa-terraform='awsume fatmap-root-terraform --role-duration 3600'
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Created by `pipx` on 2024-05-23 10:12:47
export PATH="$PATH:/Users/smccall/.local/bin"
