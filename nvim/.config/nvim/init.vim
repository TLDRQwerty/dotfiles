" Add packages
packadd! fzf.vim
packadd! editorconfig-vim
packadd! vim-fugitive
packadd! vim-ripgrep
packadd! vim-tmux-navigator
packadd! undotree
packadd! vim-which-key
packadd! vim-gitgutter
packadd! nerdcommenter

packadd! spelunker

packadd! chadtree
packadd! auto-pairs
packadd! ale

packadd! nvim-lspconfig
packadd! completion-nvim
packadd! completion-buffers
packadd! nvim-treesitter

" themes
packadd! nvim-highlite
packadd! vim-nightfly-guicolors
packadd! vim-moonfly-colors
packadd! sonokai
packadd! blue-moon
packadd! nvcode-color-schemes.vim

" syntax
packadd! vim-javascript
packadd! typescript-vim
packadd! vim-jsx-pretty
packadd! vim-glsl

syntax on
let mapleader = " "

set termguicolors
set background=dark
colorscheme sonokai

" filetypes
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.js set filetype=javascriptreact

set rtp+=~/dotfiles/zsh/.config/zsh/plugins/fzf

set termguicolors " Enable true color
set cursorline    " Show the line the cursor is on
set mouse=a       " Enable mouse
set clipboard+=unnamedplus " Use system clipboard
set list
set listchars=trail:-,tab:‣\ ,eol:¬ " Give whitespace characters
set colorcolumn=120 " Set column at end of line
set fillchars+=vert:\| " Change vertical split symbol

set noerrorbells
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2 smarttab " 1 tab = 4 spaces
set ignorecase incsearch smartcase " Smart search
set encoding=utf-8
set ruler
set nu
set noswapfile nobackup
let g:netrw_dirhistmax = 0 " Disable .netrwhist file

" Line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Live Substitution
set inccommand=split

" Swap created splits
set splitbelow
set splitright

inoremap jj <esc>	" Remap jj to esc

" Better vertical movment
nnoremap j gj
nnoremap k gk

" Better tab control
map <C-t>l :tabr<cr>
map <C-t>j :tabl<cr>
map <C-t>h :tabp<cr>
map <C-t>l :tabn<cr>

map <C-c> :nohl<cr>

" Change the size of the splits
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize  +3<CR>
nnoremap <silent> <C-Down> :resize  -3<CR>

" Create the directory if it doesn't exist when saving a file
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" Set hotkeys for frequently used keys
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

if exists('##TextYankPost')
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({})
endif

" Highlight any extra whitespace at the end of the line
highlight RedundantSpaces ctermbg=darkgray guibg=darkgray
match RedundantSpaces /\s\+$/

