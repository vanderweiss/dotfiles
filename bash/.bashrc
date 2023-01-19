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

export EXA_COLORS="$(vivid generate jellybeans)"
export LS_COLORS="$EXA_COLORS"

export NNN_OPTS='cH'
export NNN_OPENER="~/.config/plugins/nuke"
export NNN_TMPFILE='/tmp/.lastd'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_PLUG='i:imgview'

# -- Aliases ---

alias ls='\exa --all --long --numeric --octal-permissions --no-filesize --no-permissions --no-time --time-style=iso'

# --- Prompt ---

RESET="\[$(tput sgr0)\]"

PS1=" \[\e[36m\]> $RESET"
. "$HOME/.cargo/env"
