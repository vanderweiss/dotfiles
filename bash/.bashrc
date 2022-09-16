# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

export PATH="$HOME/.local/bin:$PATH"
export EDITOR='nvim'

export HISTFILESIZE=
export HISTSIZE=

export LS_COLORS="$(vivid generate dracula)"

alias ls='\exa -la --icons --no-user --no-time'

CLEAR="\[\033[0m\]"

PS1="$(tput setaf 57) \w/$CLEAR $(tput setaf 135)\h ❯ $CLEAR"

#echo -e "\n" && neofetch
