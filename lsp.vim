let g:lsp_enabled = 1
let g:lsp_format_sync_timeout = 1000
let g:ycm_auto_trigger = 1

set completeopt=menu,menuone,noselect

if isdirectory(expand("~") . "/.vim/pack/plugins/start/vim-lsp")
    for filePath in glob('~/.vim/lsp/*.vim', 1, 1)
        let fileName = fnamemodify(filePath,":t")
        let fileNameNoExt = fnamemodify(fileName,":r")
        if fileNameNoExt is "eslint-lsp" 
            continue
        endif
        execute 'source' filePath
    endfor
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

nnoremap <silent> <Leader>e :LspDocumentDiagnostics<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
