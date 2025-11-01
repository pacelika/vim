if has('win32') && !filereadable(expand('~') . "/vimfiles/autoload/plug.vim")
    execute '!powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force"'
elseif has('unix') && !filereadable(expand('~') . '/.vim/autoload/plug.vim')
    call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

if has('win32') && isdirectory(expand('~') . "/vimfiles/autoload") || has('unix') && isdirectory(expand('~') . '/.vim/autoload')
    call plug#begin()
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'dense-analysis/ale'
    Plug 'prabirshrestha/vim-lsp'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    call plug#end()
else
     echom "ERROR: Folder /autoload does not exists"
endif
