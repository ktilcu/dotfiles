" let g:LanguageClient_serverCommands = {
"     \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'typescript.tsx': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ }
" let g:LanguageClient_diagnosticsEnable=0
" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
