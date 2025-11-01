colorscheme desert
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

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

set background=dark
set termguicolors

filetype plugin on
filetype plugin indent on

source ~/.vim/commentary.vim
source ~/.vim/auto-pair.vim
source ~/.vim/clipboard.vim

source ~/.vim/plugins.vim
source ~/.vim/netrw_conf.vim
source ~/.vim/lsp.vim
source ~/.vim/fzf_conf.vim
source ~/.vim/ale_conf.vim

autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview
