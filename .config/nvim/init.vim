" Section: General Config
" ----------------------------
set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath = &runtimepath

" don't bother with vi compatibility
set nocompatible

let g:python_host_prog = '/opt/homebrew/bin/python3'
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:node_host_prog = '/Users/kyle/.nvm/versions/node/v18.5.0/bin/node'
let g:neoterm_autoscroll = 1
let $NVIM_NODE_LOG_FILE='nvim-node.log'
  let $NVIM_NODE_LOG_LEVEL='warn'
" let g:test#javascript#jest#executable = '/Users/kyletilman/.nvm/versions/node/v8.17.0/bin/node node_modules/.bin/jest'
" ensure ftdetect et al work
filetype plugin indent on

" Spaces and Tabs
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
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>delimitMateCR"
" Swap files
set backupcopy=yes                                           " see :help crontab
set directory-=.                                             " don't store swapfiles in the current directory
set nobackup
set noswapfile

" Misc
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8
set hidden                                                   " hides buffers instead of closing them
set history=1000                                             " remember more commands and search history
set pastetoggle=<F2>                                         " turn autoindent off to paste large amounts of text
set undolevels=1000                                          " use many muchos levels of undo

" Search
set hlsearch                                                 " highlight search terms
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" UI
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

" Folding
set foldenable          " don't fold files by default on open
set foldmethod=syntax   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldlevelstart=99   " start with fold level of 1

" PHP folding
let g:php_folding=2

" Splits
set splitbelow                                               " More sane window split behavior
set splitright                                               " More sane window split behavior

" Mouse Support
" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = &wildignore

" Section: Load vim-plug plugins
" ----------------------------

call plug#begin()

Plug 'tpope/vim-sensible'

" UI
Plug 'drewtempelmeyer/palenight.vim'
Plug 'trevordmiller/nova-vim'
Plug 'jcherven/jummidark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'arzg/vim-colors-xcode'
Plug 'connorholyday/vim-snazzy'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ciaranm/inkpot'
Plug 'vim-airline/vim-airline'            " Handy info
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'

" Project Navigation
" Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'vim-scripts/ctags.vim'              " ctags related stuff
" Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
" Plug 'tpope/vim-vinegar'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" File Navigation
Plug 'kshenoy/vim-signature'              " Show marks in the gutter

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-textobj-user'
Plug 'jasonlong/vim-textobj-css'
Plug 'editorconfig/editorconfig-vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'Raimondi/delimitMate'
Plug 'machakann/vim-highlightedyank'

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim',                   { 'on': 'GV' }
Plug 'jez/vim-github-hub'                 " Filetype for hub pull requests
Plug 'lambdalisue/vim-gista'              " Gist manager
" Task Running
Plug 'w0rp/ale'                           " Linter

" key bindings
Plug 'folke/which-key.nvim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" Autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'honza/vim-snippets'
Plug 'jhkersul/vim-jest-snippets'

" Language Support
" JavaScript
Plug 'janko/vim-test'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cdata/vim-tagged-template'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'mvolkmann/vim-js-arrow-function'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
" clojure
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

" PHP
Plug 'shawncplus/phpcomplete.vim'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" CSS
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Sass
Plug 'cakebaker/scss-syntax.vim'

" Python
Plug 'klen/python-mode',                  { 'for': 'python' }

" Markdown
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-pencil'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
" Plug 'preservim/vim-markdown'
" Plug 'gabrielelana/vim-markdown'
Plug 'preservim/vim-colors-pencil'
Plug 'joshdick/onedark.vim'

" Scala
Plug 'derekwyatt/vim-scala'

" XML
Plug 'actionshrimp/vim-xpath'

Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/gh.nvim'

" Fallback
Plug 'sheerun/vim-polyglot'
"4}}}
"3}}}

call plug#end()

" For some reason, a few plugins seem to have config options that cannot be
" placed in the `plugins` directory. Those settings can be found here instead.

" vim-airline
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts

" Section: External Functions
" ------------------------------

" Delete buffer found in ,b
function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction

" Strip Trailing Whitespace
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

" Section: Autocommands
" ------------------------------
if has("autocmd")

  autocmd BufReadPost * "
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif "}}}2

  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
endif


" Section: Remaps
" ------------------------------

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
nnoremap rh `[V`]
" <Space> for folds
nnoremap <space> za
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %
" Don't copy the contents of an overwritten selection.
vnoremap p "_dp


"fzf lua
noremap <silent> <C-p> :FzfLua files<CR>
noremap <leader>b :FzfLua buffers<CR>
noremap <leader>a :FzfLua live_grep<CR>
noremap <leader>gd :FzfLua grep_cword<CR>

noremap - :NvimTreeToggle<CR>

let g:markdown_fenced_languages = ['html', 'python', 'css', 'javascript', 'javascript=js', 'typescript', 'typescript=ts']

" Section: Theme
" ------------------------------

syntax enable
set background=dark
colorscheme snazzy

lua << EOF

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))

end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  on_attach = on_attach
})
EOF

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('litee.lib').setup({})
require('litee.gh').setup({})
require('fzf-lua')
vim.cmd("FzfLua register_ui_select")

require("which-key").setup()

local wk = require("which-key")
wk.register({
    g = {
        name = "+Git",
        h = {
            name = "+Github",
            c = {
                name = "+Commits",
                c = { "<cmd>GHCloseCommit<cr>", "Close" },
                e = { "<cmd>GHExpandCommit<cr>", "Expand" },
                o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
                p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
                z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
            },
            i = {
                name = "+Issues",
                p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
            },
            l = {
                name = "+Litee",
                t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
            },
            r = {
                name = "+Review",
                b = { "<cmd>GHStartReview<cr>", "Begin" },
                c = { "<cmd>GHCloseReview<cr>", "Close" },
                d = { "<cmd>GHDeleteReview<cr>", "Delete" },
                e = { "<cmd>GHExpandReview<cr>", "Expand" },
                s = { "<cmd>GHSubmitReview<cr>", "Submit" },
                z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
            },
            p = {
                name = "+Pull Request",
                c = { "<cmd>GHClosePR<cr>", "Close" },
                d = { "<cmd>GHPRDetails<cr>", "Details" },
                e = { "<cmd>GHExpandPR<cr>", "Expand" },
                o = { "<cmd>GHOpenPR<cr>", "Open" },
                p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
                r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
                t = { "<cmd>GHOpenToPR<cr>", "Open To" },
                z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
            },
            t = {
                name = "+Threads",
                c = { "<cmd>GHCreateThread<cr>", "Create" },
                n = { "<cmd>GHNextThread<cr>", "Next" },
                t = { "<cmd>GHToggleThread<cr>", "Toggle" },
            },
        },
    },
}, { prefix = "<leader>" })

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})

EOF
