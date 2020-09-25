# dotfiles

Uses [GNU Stow](https://www.gnu.org/software/stow/) for managing the files

## Installation
1. Clone the repo
`git clone git@github.com:tldrqwerty/dotfiles --recursive`
2. Install fzf
`cd dotfiles/zsh/.config/zsh/plugins/fzf/.install`
3. Stow the wanted directiories
`stow <dir>`

### NEOVIM
Requires `xclip` if you want neovim to use the system clipboard
