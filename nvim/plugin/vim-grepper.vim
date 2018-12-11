let g:grepper = {
  \ 'tools': ['rg', 'git', 'ag'],
  \ }

nnoremap <leader>a :Grepper<space>
nnoremap <leader>gd :Grepper<space><C-r><C-w><CR>
command! -nargs=* -complete=file Rg Grepper -noprompt -tool rg -query <args>
