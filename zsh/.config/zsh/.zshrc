autoload -Uz compinit promptinit
compinit
promptinit
# General Config
zstyle ':completion:*' menu select
setopt globdots

zmodload -i zsh/complist

setopt autocd

# History

HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTTIMEFORMAT="[%F %T]"

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Keybindings

bindkey -v

## Menu Navigation

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

if (( $+commands[zoxide] )); then
	eval "$(zoxide init zsh)"
	alias cd="z"
fi

if (( $+commands[exa] )); then
	alias ls="exa"
fi

if (( $+commands[fzf] )); then
	export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

  export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    source "$(brew --prefix)/opt/fzf/key-bindings.zsh"
    source "$(brew --prefix)/opt/fzf/completion.zsh"
  fi
else
  bindkey '^R' history-incremental-search-backward
fi

if (( $+commands[nvim] )); then
	alias vim="nvim"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	export XDG_CONFIG_HOME=$HOME/.config
	export XDG_CACHE_HOME=$HOME/.cache
	export XDG_DATA_HOME=$HOME/.local/share
	export XDG_STATE_HOME=$HOME/.local/state

	export ANDROID_SDK_ROOT=/opt/android-sdk
	export ANDROID_NDK=/opt/android-ndk

	export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH
	export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH

	export PATH=$HOME/.local/bin:$PATH

  export PATH=$HOME/.cargo/bin:$PATH

	export NVM_DIR="$XDG_CACHE_HOME/.nvm"
	[ -s "/usr/share/nvm/nvm.sh" ] && \. "/usr/share/nvm/nvm.sh"  # This loads nvm
	[ -s "/usr/share/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/share/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
elif [[ "$OSTYPE" == "darwin"* ]]; then
	export PATH="/Users/radfive/.jenv/shims:${PATH}"
	export JENV_SHELL=zsh
	export JENV_LOADED=1
	unset JAVA_HOME
	jenv rehash 2>/dev/null
	jenv refresh-plugins
	jenv() {
		typeset command
		command="$1"
		if [ "$#" -gt 0 ]; then
			shift
		fi

		case "$command" in
			enable-plugin|rehash|shell|shell-options)
				eval `jenv "sh-$command" "$@"`;;
			*)
				command jenv "$command" "$@";;
		esac
	}

	export NVM_DIR="$HOME/.nvm"
	[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
	[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

	export ANDROID_HOME=$HOME/Library/Android/sdk
	export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$ANDROID_HOME/emulator
	export PATH=$PATH:$ANDROID_HOME/cmdline-tools
	export PATH=$PATH:$ANDROID_HOME/platform-tools

	export PATH=/opt/homebrew/bin:$PATH

	export PATH=$HOME/.jenv/bin:$PATH
	if (( $+commands[jenv] ));then
		eval "$(jenv init -)"
	fi

	export TERMINAL="iterm2"

	export XDG_CONFIG_HOME=$HOME/.config
	export XDG_CACHE_HOME=$HOME/.cache
	export XDG_DATA_HOME=$HOME/.local/share
elif [[ "$OSTYPE" == "win32"* ]]; then
fi

alias l="ls"
alias ll="l -l"
alias la="l -a"
alias lla="ll -a"

alias lg="lazygit"

alias rzsh="source $HOME/.config/zsh/.zshrc"

alias g="git"


if (( $+commands[rbenv] )); then
	eval "$(rbenv init - zsh)"
fi

# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
	[[ $1 = 'block' ]]; then
	echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
	[[ ${KEYMAP} == viins ]] ||
	[[ ${KEYMAP} = '' ]] ||
	[[ $1 = 'beam' ]]; then
	echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select


[ -s "$ZDOTDIR/prompt.zsh" ] && source "$ZDOTDIR/prompt.zsh"
[ -s "$ZDOTDIR/autocmd.zsh" ] && source "$ZDOTDIR/autocmd.zsh"
