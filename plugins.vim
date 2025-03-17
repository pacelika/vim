call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'

Plug 'metalelf0/base16-black-metal-scheme'

call plug#end()

" augroup MyPlugPlug
"     autocmd!
"     autocmd VimEnter * call timer_start(100, {-> execute('PlugInstall --sync')})
" augroup END
