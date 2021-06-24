export ZDOTDIR=$HOME/.config/zsh

export _JAVA_AWT_WM_NONREPARENTING=1

export DOTFILES=$HOME/dotfiles

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export GOPATH=$XDG_DATA_HOME/go

export EDITOR='nvim'
export BROWSER='firefox'
export TERMINAL='alacritty'

export ANDROID_SDK_ROOT=/opt/android-sdk

# I don't know why I need this however if I don't have it yarn "locates" a config file in ~/.config directory either thought there isn't any
unset NPM_CONFIG_USERCONFIG
