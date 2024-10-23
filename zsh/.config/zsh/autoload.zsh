autoload -U add-zsh-hook

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
