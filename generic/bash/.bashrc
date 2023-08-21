if [[ $- != *i* ]] ; then
	return
fi

export PATH="$HOME/.local/bin:$PATH"
export EDITOR='hx'

export HISTFILESIZE=
export HISTSIZE=

alias ls='exa --all --long --numeric --octal-permissions --no-permissions --no-time'

PS1="\[\e[1;34m\]\u@\H \w \n \[\e[1;34m\]> \[\e[0m\]"

. "$HOME/.cargo/env"

cd ~/ 
