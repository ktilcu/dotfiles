let b:js_breakpoint_cmd = 'debugger;'

setlocal foldmethod=manual
setlocal concealcursor=nc
setlocal cc=""
" setlocal conceallevel=2

function! JavaScriptBreakpoint(lnum)
  let line = getline(a:lnum)
  if strridx(line, b:js_breakpoint_cmd) != -1
    normal dd
  else
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).b:js_breakpoint_cmd)
    normal k
  endif
endfunction

" Load snips
autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine
autocmd FileType js UltiSnipsAddFiletypes javascript-node
autocmd FileType js UltiSnipsAddFiletypes javascript-jsdoc

nnoremap <LocalLeader>d :call JavaScriptBreakpoint(line('.'))<CR>
