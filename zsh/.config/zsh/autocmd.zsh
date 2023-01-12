# Autoload nvm
autoload -U add-zsh-hook
load-nvmrc() {
  # Note: $+commands[nvm] doesn't work for this, nto sure why
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
load-nvmrc

# Autoload rbenv
load-rbenv() {
  if (( !$+commands[rbenv] )); then
		return
	fi
	if [[ -f .ruby-version && -r .ruby-version ]]; then
		rbenv shell $(cat .ruby-version)
		echo "Now using ruby $(ruby --version)"
	elif [[ $(rbenv version | awk '{print $1}') != $(rbenv global)  ]]; then
		echo "Reverting to rbenv global version"
		echo "Now using global version of ruby: $(ruby --version)"
		rbenv shell $(rbenv global)
	fi
}
add-zsh-hook chpwd load-rbenv
load-rbenv
