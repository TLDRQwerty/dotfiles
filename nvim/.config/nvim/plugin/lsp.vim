" let g:nvim_lsp = 1
"
" function! s:load_lsp() abort
"   doautoall FileType
" endfunction
"
" augroup lsp_load_aucommands
"   au BufEnter * ++once call s:load_lsp()
" augroup END
"
" command! -nargs=0 LoadLsp call s:load_lsp()
