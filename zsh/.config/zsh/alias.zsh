if (( $+commands[eza] )); then
  alias ls='eza --icons --group-directories-first'
fi

if (( $+commands[bat] )); then
  alias cat='bat --color=always'
fi

if (( $+commands[fd] )); then
  alias find='fd'
fi

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd cd)"
fi

if (( $+commands[sd] )); then
  alias sed='sd'
fi

if (( $+commands[nvim] )); then
  alias vim='nvim'
fi

if (( $+commands[procs] )); then
  alias ps='procs'
fi

if (( $+commands[pyenv] )); then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

	alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi

if (( $+commands[fnm] )); then
	eval "$(fnm env --corepack-enabled --use-on-cd --shell zsh)"
fi

alias g='git'
alias lg='lazygit'

alias _='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias rzsh='source $ZDOTDIR/.zshrc'

alias android-list-devices="adb devices | grep -E 'device$' | awk '{print \$1}' | fzf"

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ios-list-devices="xcrun xctrace list devices | grep -E '\(.*\)' | fzf"

  alias ios-device-id="ios-list-devices | awk -F '[(]|[)]' '{print \$(NF-1)}'"

  alias react-native-run-ios="ios-device-id | xargs -I{} npx react-native run-ios --udid '{}'"
  alias launch-ios-simulator="xcrun simctl list | grep 'Shutdown' | fzf | grep -oE '(\b[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\b)' | xargs -I{} xcrun simctl boot {}"
  alias ios-log="xcrun simctl list | grep 'Booted' | fzf | grep -oE '(\b[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\b)' | xargs -I{} xcrun simctl spawn {} log stream --level debug --style compact --process IB"
fi
