setlocal spell
autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'}) | set textwidth=0
