# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export EDITOR='nvim'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	export BROWSER='firefox'
elif [[ "$OSTYPE" == "darwin"* ]]; then
	export BROWSER='open -a arc'
fi


[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
ZDOTDIR=$HOME/.config/zsh
