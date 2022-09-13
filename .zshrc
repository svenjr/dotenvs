# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="half-life"
ZSH_THEME="zsh2000"

export ZSH_2000_DISABLE_RVM='true'

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
)

# TODO: This causes new terminals to always open at `cd`
# Let's pull out dotenvs repo to make sure we are up-to-date
cd ~/Documents/dotenvs && git pull -qf && cd

# Force git to use our .gitignore file here as global
# TODO: For some reason the symlink does not work
git config --global core.excludesfile ~/Documents/dotenvs/.gitignore

source $ZSH/oh-my-zsh.sh

# Load local ENVs which will not come to git
if [ -f ~/.env ]; then
    # Load Environment Variables
    set -o allexport; source ~/.env; set +o allexport
fi

# This exports the second path homebrew from M1 macs
export PATH="/opt/homebrew/bin:$PATH"

# Source Chruby and add magic lines
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

######################### ALIASES #########################
# Aliases which use secret passwords loaded from .env
alias atlas-dev="psql postgres://$ATLAS_DEV_USER:$ATLAS_DEV_PASS@titicaca-development-atlas.$AWS_DEV_HOST:5432/atlas_production"

alias atlas-prod="psql postgres://$ATLAS_PROD_USER:$ATLAS_PROD_PASS@annency-production-atlas.$AWS_PROD_HOST:5432/atlas_production"

alias xenos-dev="psql postgres://$XEN_DEV_USER:$XEN_DEV_PASS@titicaca-development-xenos.$AWS_DEV_HOST:5432/xenos"

alias xenos-prod="psql postgres://$XEN_PROD_USER:$XEN_PROD_PASS@annency-production-xenos.$AWS_PROD_HOST:5432/xenos"

alias users-prod="psql postgres://$USER_PROD_USER:$USER_PROD_PASS@annecy-production-users.$AWS_PROD_HOST:5432/users"

alias dwh="psql postgres://$DWH_USER:$DWH_PASS@titicaca-development-data-warehouse.$AWS_DEV_HOST/data_warehouse"

# Other Aliases
# Kube contexts
alias awsume=". awsume"
alias m-mfa-engineering='awsume fatmap-default-engineering -o fatmap-default && awsume -u'
alias awsume-root="awsume fatmap-root-engineering"

alias kcuc-dev='kubectl config set current-context platform-development'
alias kcuc-prod='kubectl config set current-context platform-production'

alias docker_kill_everything="sudo docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"

# Jump into the devops cotainer
alias k8s="sudo cd && cd ~/Documents/platform-config/ && make run"

# Open a vim editor for the rc
alias profile="cd && vim .zshrc"

# Resource the profile
alias resource="source ~/.zshrc"

#show me sizes of things in my current directory
alias sizes='sudo du -sh */'

alias switch_psql_14='brew unlink postgresql && brew link postgresql'
alias switch_psql_13='brew link --overwrite postgresql@13'

alias sqs-grep='/Users/sven/sqs-grep'

alias check-unsets='echo "Dev:" && kustomize build ./deploy/clusters/dev/platform-development | grep unset; echo "Prod:" && kustomize build ./deploy/clusters/prod/platform-production | grep unset'

clear
echo -e "STATUS: \033[92mACTIVE\033[0m
Welcome :)

Some helpful tools:
  - sizes: get the size of things in the current directory
  - resource: re-source this RC file
  - profile: vim edit this RC file
  - kcuc-dev: dev k8s context
  - kcuc-prod: prod k8s context
  - k8s: jump into the platform-config container
  - google [search]: google search straight from the terminal
  - hs [search]: search your history for past commands with containing this term"
export AWS_CONFIG_FILE=/Users/sven/.aws/fatmap-config
alias fm-mfa-engineering='awsume fatmap-default-engineering -o fatmap-default && awsume -u'
alias fm-mfa-terraform='awsume fatmap-root-terraform --role-duration 3600'
