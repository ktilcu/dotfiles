let g:ale_linters = {
\   'javascript': ['tslint', 'tsserver', 'eslint'],
\   'typescript': ['tslint', 'tsserver', 'eslint'],
\   'html': []
\  }
" let g:ale_linters_ignore = {'javascript':['tslint'], 'typescript': ['tslint']}
let g:ale_linter_aliases = {
\  'jsx': 'javascript',
\  'typescript.tsx': 'typescript',
\  'typescriptreact': 'typescript'
\  }

let g:ale_fixers = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint'],
\   }

nmap <leader>d <Plug>(ale_fix)

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

" Use ALT-k and ALT-j to navigate errors
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)
