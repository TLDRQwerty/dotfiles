autoload -U add-zsh-hook

load-nvmrc() {
  if [ ! type nvm &> /dev/null ]; then
    return
  fi

  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc

load-rbenv() {
  if [ ! command -v rbenv &> /dev/null ]; then
    return
  fi

  if [[ -f .ruby-version && -r .ruby-version ]]; then
    rbenv shell $(cat .ruby-version)
  elif [[ $(rbenv version) != $(rbenv version default)  ]]; then
    echo "Reverting to rbenv default version"
    rbenv shell default
  fi
}

# add-zsh-hook chpwd load-rbenv
