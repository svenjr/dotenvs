# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<


alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias profile="cd && vim .bash_profile"

alias resource="cd && source .bash_profile"

#show me sizes of things in my current directory
alias sizes='sudo du -sh */'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

# virtualenv and virtualenvwrapper
#export WORKON_HOME=/Users/sven/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#source /usr/local/bin/virtualenvwrapper.sh

#some git things
echo "--> Setting git branch finder"
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

arrow=$'\xe2\x9e\xa4'
export PS1=$"\u>>\[\033[93m\][\w]\[\033[0m\]\[\033[92m\]\$(git_branch)\[\033[0m\]\033[91m\][\d - \t]\[\033[0m\]\n$arrow "

# Git auto complete
echo "--> Setting GIT auto-complete things up"
if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

# Sublime
echo "--> Sourcing sublime text"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:${PATH}"

# Source Chruby
source /usr/local/share/chruby/chruby.sh

#And let us know we are here
echo -e "PROFILE: \033[93mSVEN\033[0m!
STATUS: \033[92mACTIVE\033[0m
Welcome :)"
