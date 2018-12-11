" Section: General Config {{{1
" ----------------------------
set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath = &runtimepath

" don't bother with vi compatibility
set nocompatible

let g:python3_host_prog  = '/usr/local/Cellar/python/3.6.5/bin/python3'

" ensure ftdetect et al work
filetype plugin indent on

" Spaces and Tabs {{{
set autoindent
set backspace=2                                              " Fix broken backspace in some setups
set expandtab                                                " expand tabs to spaces
set nowrap                                                   " don't wrap lines
set scrolloff=3                                              " show context above/below cursorline
set shiftround                                               " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4                                             " number of spaces to use for autoindenting
set smarttab                                                 " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 4 characters
set linebreak

" Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" indent <CR> in function braces
let delimitMate_expand_cr = 1

" }}}
" Swap files {{{
set backupcopy=yes                                           " see :help crontab
set directory-=.                                             " don't store swapfiles in the current directory
set nobackup
set noswapfile
" }}}
" Misc {{{
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8
set hidden                                                   " hides buffers instead of closing them
set history=1000                                             " remember more commands and search history
set pastetoggle=<F2>                                         " turn autoindent off to paste large amounts of text
set undolevels=1000                                          " use many muchos levels of undo
" }}}
" Search {{{
set hlsearch                                                 " highlight search terms
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
" }}}
" UI {{{
set background=dark
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set modelines=1
set number                                                   " show line numbers
set ruler                                                    " show where you are
set showcmd
set showmatch                                                " set show matching parenthesis
" 0 -> solid block
" 1 -> cursor line
" 2 -> solid underscore
" insert
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" normal
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" }}}
" Folding {{{
set foldenable          " don't fold files by default on open
set foldmethod=syntax   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldlevelstart=99   " start with fold level of 1
" PHP folding
let g:php_folding=2
nnoremap <space> za
" }}}
" Splits {{{
set splitbelow                                               " More sane window split behavior
set splitright                                               " More sane window split behavior
" }}}
" Mouse Support {{{
" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif
" }}}
" Netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = &wildignore
" }}}
" 1}}}

" Section: Load vim-plug plugins {{{

" Specify plugins {{{2
filetype on " without this vim emits a zero exit status, later, because of :ft off

" if filereadable(expand("~/.nvimrc.plug"))
"   source ~/.nvimrc.plug
" endif

call plug#begin()

Plug 'ervandew/supertab'
Plug 'tpope/vim-sensible'
" UI {{{3
Plug 'trevordmiller/nova-vim'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'            " Handy info
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/vim-color-spring-night'

" Project Navigation {{{3
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-vinegar'

" File Navigation {{{3
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'kshenoy/vim-signature'              " Show marks in the gutter

" Editing {{{3
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user'
Plug 'jasonlong/vim-textobj-css'
Plug 'editorconfig/editorconfig-vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'Raimondi/delimitMate'

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim',                   { 'on': 'GV' }
Plug 'jez/vim-github-hub'                 " Filetype for hub pull requests
Plug 'lambdalisue/vim-gista'              " Gist manager

" Task Running
Plug 'w0rp/ale'                           " Linter

" Autocomplete {{{3
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Snippets {{{4
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Language Support {{{3
" JavaScript {{{4
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/npm-debug-log.vim'
Plug 'neovim/node-host',                  { 'do': 'npm install' }
Plug 'cdata/vim-tagged-template'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" TypeScript {{{4
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript',       { 'do': ':UpdateRemotePlugins' }

" PHP {{{4
Plug 'shawncplus/phpcomplete.vim'

" Handlebars
Plug 'joukevandermaas/vim-ember-hbs'

" HTML {{{4
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" CSS {{{4
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Sass {{{4
Plug 'cakebaker/scss-syntax.vim'

" Python {{{4
Plug 'klen/python-mode',                  { 'for': 'python' }

" Markdown {{{4
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'gabrielelana/vim-markdown'

" Fallback {{{4
Plug 'sheerun/vim-polyglot'
"4}}}
"3}}}

call plug#end()
" 2}}}
" Load plugin configurations {{{2
" For some reason, a few plugins seem to have config options that cannot be
" placed in the `plugins` directory. Those settings can be found here instead.

" vim-airline {{{3
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts
" 3}}}
" 2}}}
" }}}

" Section: External Functions {{{
" Delete Buffer {{{
function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction
" }}}
" Strip Trailing Whitespace {{{
" thanks to http://vimcasts.org/e/4
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" 1}}}
"}}}

" Section: Autocommands {{{1
" --------------------------
if has("autocmd")
  filetype plugin indent on

  autocmd BufReadPost * " {{{2
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif "}}}2

  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss.css

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

  " Load snips
  autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine
  autocmd FileType js UltiSnipsAddFiletypes javascript-node
  autocmd FileType js UltiSnipsAddFiletypes javascript-jsdoc

  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
endif

" }}}

" Section: Remaps {{{1

let mapleader = ','
inoremap jj <ESC>
nnoremap H ^
nnoremap L $
onoremap H ^
onoremap L $
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader><space> :call Preserve("%s/\\s\\+$//e")<CR>
noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" horizontal split
noremap <leader>- <c-w>s
" vertical split
noremap <leader>\ <c-w>v
" close split
noremap <leader>\\ <c-w>q
" Rebalance split
nnoremap <leader>[ <c-w>=
" Maximize split
nnoremap <leader>] <c-w><bar>
" sort lines by length
vmap <leader>l :'<,'>'<,'> ! awk '{ print length(), $0 <bar> "sort -n <bar> cut -d\\  -f2-" }'<CR>
" Replace the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
" Close buffers
nmap <leader>w :bd<CR>
" clears the search buffer when you press ,/
nmap <silent> ,/ :nohlsearch<CR>
" Reselect text from last action
nnoremap gr `[V`]
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %
" Don't copy the contents of an overwritten selection.
vnoremap p "_dP
noremap <leader>d :Vex<CR>

" 1}}}

" Section: Theme {{{
syntax enable
set background=dark
" colorscheme spring-night
colorscheme custom-nova
" }}}

" RG {{{
let g:rg_command = 'rg --vimgrep --smart-case'
" }}}
" vim:foldmethod=marker:foldlevel=0
