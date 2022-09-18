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

export EXA_COLORS="$(vivid generate dracula)"

alias ls='\exa --all --group --long --numeric --icons --octal-permissions --no-filesize --no-permissions --no-time --time-style=iso'

function color() {
	echo "\[$(tput setaf $1)\]"	
}

RESET="\[$(tput sgr0)\]"

PS1="$(color 57) \w/${RESET} $(color 135)> ${RESET}"

#echo -e "\n" && neofetch
