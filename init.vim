set noerrorbells
set visualbell
set t_vb=

set number
set nu
set relativenumber

set termguicolors
set noswapfile
set nobackup
set undofile
set wrap

set tabstop=4 expandtab
set shiftwidth=4
set cursorline
set numberwidth=6
set softtabstop=4

set smarttab
set smartindent

set smartcase
set ignorecase

set autoindent 
set cindent 
set backspace=indent

set clipboard="unnamedplus"

set mouse="a"

set nohlsearch
set incsearch
set showmatch

set background="dark"
colorscheme desert
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

syntax on
filetype plugin on
filetype plugin indent on

set packpath^=~/.vim/pack/vendor/start/
set omnifunc=ccomplete#Complete
set tags=~/.vim/tags,tags

source ~/.vim/lsp.vim