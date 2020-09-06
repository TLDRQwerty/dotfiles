let g:nvim_lsp = 1

function! s:load_lsp() abort
  packadd! nvim-lsp
  packadd! lsp-status
  packadd! diagnostic-nvim

  execute 'luafile ' . stdpath('config') . '/lua/lsp.lua'
  doautoall FileType
endfunction

augroup lsp_load_aucommands
  au BufEnter * ++once call s:load_lsp()
augroup END

command! -nargs=0 LoadLsp call s:load_lsp()
