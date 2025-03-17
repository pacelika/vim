set allowrevins

set noswapfile
set nobackup

set noerrorbells
set novisualbell
set novb t_vb=

set number
set nu
set relativenumber
set numberwidth=6

set cursorline
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

source ~/.vim/clipboard.vim
source ~/.vim/netrw_conf.vim

source ~/.vim/plugins.vim
source ~/.vim/lsp.vim
source ~/.vim/fzf_conf.vim
source ~/.vim/ale_conf.vim

autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview

colorscheme base16-black-metal-gorgoroth
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

highlight LineNr guibg=black guifg=gray
highlight CursorLineNr guibg=black guifg=white
highlight SignColumn guibg=black
