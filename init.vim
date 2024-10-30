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

set ignorecase

const tab_alignment = 4

execute 'set tabstop=' . tab_alignment " expandtab"
execute "set shiftwidth=" . tab_alignment
execute "set softtabstop=" .tab_alignment

set numberwidth=6
set cursorline

set smarttab
set smartindent
set smartcase

set autoindent 
set cindent 
set backspace=indent,eol,start

set nohlsearch
set incsearch
set showmatch

set clipboard=unnamedplus

set omnifunc=ccomplete#Complete
set tags=~/.vim/tags,tags

set background="dark"
colorscheme desert
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

syntax on
filetype plugin on
filetype plugin indent on

source ~/.vim/lsp.vim
