## Performance Metrics
# zmodload zsh/zprof

# # set the trace prompt to include seconds, nanoseconds, script name and line number
# # This is GNU date syntax; by default Macs ship with the BSD date program, which isn't compatible
# PS4='+$(date "+%s:%N") %N:%i> '
# # save file stderr to file descriptor 3 and redirect stderr (including trace 
# # output) to a file with the script's PID as an extension
# exec 3>&2 2>/tmp/startlog.$$
# # set options to turn on tracing and expansion of commands contained in the prompt
# setopt xtrace prompt_subst

autoload -U compinit; compinit
autoload -U promptinit; promptinit

# History Options
export HISTFILE=$HOME/.cache/zsh/history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT="[%F %T] "

export EDITOR=nvim

fpath=($ZDOTDIR/functions $fpath)

setopt APPEND_HISTORY
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

setopt AUTO_CD
setopt GLOB_DOTS

zstyle ':completion:*' menu select
zmodload -i zsh/complist

# VIM mode
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
export KEYTIMIEOUT=1

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
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

if (( $+commands[eza] )); then
  alias ls='eza --icons'
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

if (( $+commands[fzf] ));then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
  fi

  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --layout=reverse \
    --border \
    --height=80%"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export FZF_CTRL_R_OPTS=" \
      --preview 'echo {}' --preview-window up:3:hidden:wrap
      --bind 'ctrl-/:toggle-preview'
      --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip)+abort'
      --color header:italic
      --header 'Press CTRL-Y to copy command into clipboard'"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    export FZF_CTRL_R_OPTS=" \
      --preview 'echo {}' --preview-window up:3:hidden:wrap
      --bind 'ctrl-/:toggle-preview'
      --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
      --color header:italic
      --header 'Press CTRL-Y to copy command into clipboard'"
  fi

  if (( $+commands[bat] )); then
    export FZF_CTRL_T_OPTS="
      --preview 'bat -n --color=always {}'
      --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  fi
  if (( $+commands[eza] )); then
    export FZF_ALT_C_OPTS="--preview 'eza --icons --tree {}'"
  fi
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"

  export ANDROID_SDK_ROOT="/opt/android-sdk/"
  export ANDROID_HOME="$ANDROID_SDK_ROOT"

  export PATH="$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools"

elif [[ "$OSTYPE" == "darwin"* ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh" --no-use
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion"

  export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
  export ANDROID_HOME=$ANDROID_SDK_ROOT
	export PATH=${CMAKE_BIN_PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}


  if [[ -f /opt/homebrew/bin/brew ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi
  # if (( $+commands[brew] )); then
  #   FPATH+=($(brew --prefix)/share/zsh-completions)
  # fi

  if (( $+commands[jenv] )); then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
  fi

  if (( $+commands[rbenv] )); then
    eval "$(rbenv init -)"
  fi

  alias ios-list-devices="xcrun xctrace list devices | grep -E '\(.*\)' | fzf"

  alias ios-device-id="ios-list-devices | awk -F '[(]|[)]' '{print \$(NF-1)}'"

  alias react-native-run-ios="ios-device-id | xargs -I{} npx react-native run-ios --udid '{}'"
  alias launch-ios-simulator="xcrun simctl list | grep 'Shutdown' | fzf | grep -oE '(\b[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\b)' | xargs -I{} xcrun simctl boot {}"
  alias ios-log="xcrun simctl list | grep 'Booted' | fzf | grep -oE '(\b[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\b)' | xargs -I{} xcrun simctl spawn {} log stream --level debug --style compact --process IB"

	export PATH="$PATH:$HOME/.cargo/bin"

fi

alias android-list-devices="adb devices | grep -E 'device$' | awk '{print \$1}' | fzf"
function android-logcat() {
  local deviceCount=$(adb devices | grep -E 'device$' | wc -l)

  if [[ $deviceCount -gt 1 ]]; then
    local device_id=$(android-list-devices)
    adb -s $device_id logcat "$@"
  else
    adb logcat "$@"
  fi
}

function android-install() {
  local deviceCount=$(adb devices | grep -E 'device$' | wc -l)

  if [[ $deviceCount -gt 1 ]]; then
    local device_id=$(android-list-devices)
    adb -s $device_id install "$@"
  else
    adb install "$@"
  fi
}

function android-shell() {
  local deviceCount=$(adb devices | grep -E 'device$' | wc -l)

  if [[ $deviceCount -gt 1 ]]; then
    local device_id=$(android-list-devices)
    adb -s $device_id shell
  else
    adb shell
  fi
}

function android-pull() {
  local deviceCount=$(adb devices | grep -E 'device$' | wc -l)

  if [[ $deviceCount -gt 1 ]]; then
    local device_id=$(android-list-devices)
    adb -s $device_id pull "$@"
  else
    adb pull "$@"
  fi
}

function android-push() {
  local deviceCount=$(adb devices | grep -E 'device$' | wc -l)

  if [[ $deviceCount -gt 1 ]]; then
    local device_id=$(android-list-devices)
    adb -s $device_id push "$@"
  else
    adb push "$@"
  fi
}

if command -v pnpm &> /dev/null; then
	eval "$(pnpm completion zsh)"
fi

[ -s "$ZDOTDIR/prompt.zsh" ] && source "$ZDOTDIR/prompt.zsh"
[ -s "$ZDOTDIR/autoload.zsh" ] && source "$ZDOTDIR/autoload.zsh"

[ -s "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -s "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)

## Capture performance metrics
# # zprof > /tmp/foo
# # turn off tracing
# unsetopt xtrace
# # restore stderr to the value saved in FD 3
# exec 2>&3 3>&-
