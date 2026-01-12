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

if has('win32') && filereadable(expand('~') . "/vimfiles/colors/sunbather.vim")
    colorscheme sunbather
elseif has('unix')
    colorscheme sunbather
endif

autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

set background=dark
set termguicolors

filetype plugin on
filetype plugin indent on

execute 'source ' . g:config_dir . '/commentary.vim'
execute 'source ' . g:config_dir . '/auto-pair.vim'
execute 'source ' . g:config_dir . '/clipboard.vim'
execute 'source ' . g:config_dir . '/plugins.vim'

if has('win32') && isdirectory(expand('~') . "/vimfiles/plugged") || has('unix') && isdirectory(expand('~') . '/.vim/plugged')
    execute 'source ' . g:config_dir . '/netrw_conf.vim'
    execute 'source ' . g:config_dir . '/lsp.vim'
    execute 'source ' . g:config_dir . '/fzf_conf.vim'
    execute 'source ' . g:config_dir . '/ale_conf.vim'
else
    echom "INFO: Plugins are not installed."

    if has('win32') && filereadable(expand('~') . "/vimfiles/autoload/plug.vim") || has('unix') && filereadable(expand('~') . '/.vim/autoload/plug.vim')
        execute "PlugInstall"
        echom "INFO: Installed plugins"
    endif
endif

autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview
