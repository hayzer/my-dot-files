# /etc/skel/.bashrc:
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# User specific aliases and functions
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
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

# Add-on for comfortable CouchDB command line
if [ -f ~/test/resty ]; then
	. ~/test/resty
fi

# Put your fun stuff here.
 if [ ${BASH_VERSINFO[0]} -lt 3 ]; then
	export PS4='>[ ${0}:${LINENO}: ${FUNCNAME[0]} ] '
else
	export PS4='>[ ${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]} ] '
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
