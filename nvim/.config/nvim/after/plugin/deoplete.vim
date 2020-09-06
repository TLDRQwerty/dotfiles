" let g:deoplete#enable_at_startup = 1
" call deoplete#enable()
"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" " Disable the truncate feature.
" call deoplete#custom#source('_',
"       \ 'max_abbr_width', 0)
" call deoplete#custom#source('_',
"       \ 'max_menu_width', 0)
"
" inoremap <silent><expr> <C-Space>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#mappings#manual_complete()
"
" function! s:check_back_space() abort "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
