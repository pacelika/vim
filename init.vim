const uName = trim(system("uname"))
let g:formatOnSave = 0
let g:sneak#label = 1

set noswapfile
set nobackup
set noerrorbells

set visualbell
set t_vb=

set number
set nu
set relativenumber
set numberwidth=6
set cursorline

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

set clipboard=unnamedplus

set omnifunc=ccomplete#Complete
set tags=~/.vim/tags,tags

set background="dark"
set termguicolors
colorscheme desert
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

syntax on
filetype plugin on
filetype plugin indent on

source ~/.vim/lsp.vim
source ~/.vim/prettier.vim
source ~/.vim/git.vim

if isdirectory(expand("~") . "/.vim/pack/plugins/start/fzf.vim")
    nnoremap <c-p> :Files<CR>
endif

if uName == "Darwin"
    vnoremap <C-c> :w !pbcopy<CR><CR>
elseif uName == "Linux"
    vnoremap <C-c> :w !xclip -selection clipboard<CR><CR>
endif
