# .bashrc

# User specific aliases and functions
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/profile.d/mats.sh ]; then
	. /etc/profile.d/mats.sh
fi

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

if [ -f ~/.functions ]; then
	. ~/.functions
fi

if [ -f ~/.colors ]; then
	. ~/.colors
fi

if [ -f ~/.variables ]; then
	. ~/.variables
fi

if [ -f /etc/bash_completion.d/matsrunner ]; then
	. /etc/bash_completion.d/matsrunner 
fi

if [ -f  /etc/bash_completion.d/matsrunner2html ]; then
	. /etc/bash_completion.d/matsrunner2html
fi

# Expand the environment
# User specific environment and startup programs
PATH=$PATH:${HOME}/bin
export PATH

# Keep the history save
shopt -s histappend

PROMPT_COMMAND=$(history -a)

# git-vars
GIT_EDITOR=vim

# local::lib
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

# git prompt
source ~/.bash_prompt
