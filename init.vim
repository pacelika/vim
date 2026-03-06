let g:config_dir = expand('<sfile>:p:h')

set allowrevins

set nocompatible
set lazyredraw
set ttyfast
set notimeout ttimeout ttimeoutlen=50
set nojoinspaces
set signcolumn=yes

if has("win32") || has("win64")
    set guifont=Consolas:h18
endif

set noswapfile
set nobackup
set nowritebackup

set noerrorbells
set novisualbell
set novb t_vb=

set number
set nu
set relativenumber
set numberwidth=6

set nocursorline
set guicursor=i:ver100

set wrap
set ignorecase
set smartcase

const TAB_ALIGNMENT = 4

execute 'set tabstop='.TAB_ALIGNMENT " expandtab"
execute "set shiftwidth=".TAB_ALIGNMENT
execute "set softtabstop=".TAB_ALIGNMENT
set smarttab

set smartindent
set autoindent
set cindent
set backspace=indent,eol,start

set nohlsearch
set incsearch
set showmatch

set omnifunc=ccomplete#Complete
set tags=~/.vim/tags,tags

set termguicolors
set background=dark

colorscheme desert
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

filetype plugin on
filetype plugin indent on

execute 'source ' . g:config_dir . '/commentary.vim'
execute 'source ' . g:config_dir . '/auto-pair.vim'
execute 'source ' . g:config_dir . '/clipboard.vim'
execute 'source ' . g:config_dir . '/lsp.vim'

autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview
