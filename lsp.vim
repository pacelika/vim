let g:lsp_diagnostics_enabled = 1
let g:lsp_enabled = 1

let s:COC_EXTPATH = expand("~") . "/.config/coc/extensions/node_modules"

function! IsCocExtPresent(extension)
    return isdirectory(s:COC_EXTPATH . "/" . a:extension)
endfunction

let lspDict = {}
let cocExtsToInstall = []

autocmd User CocNvimInit call StartupLsp()
autocmd VimEnter * if exists('*CocStop') | call CocStop() | endif

function! StartupLsp()
    for cocExt in cocExtsToInstall 
        call CocInstall cocExt
    endfor
endfunction

for filePath in glob('~/.vim/lsp/*.vim', 1, 1)
    let fileName = fnamemodify(filePath,":t")
    let fileNameNoExt = fnamemodify(fileName,":r")
    if fileNameNoExt is "eslint-lsp" 
        continue
    endif
    let lspDict[fileNameNoExt] = { 'filePath' : filePath,'prefer-model': "default+coc",'exec': v:null,'coc-ext': v:null}
endfor

let lspDict["svelte-lsp"]["exec"] = "svelteserver"
let lspDict["svelte-lsp"]["coc-ext"] = "coc-svelte"

let lspDict["typescript-lsp"]["exec"] = "typescript-language-server"
let lspDict["typescript-lsp"]["coc-ext"] = "coc-tsserver"

let lspDict["clangd-lsp"]["exec"] = "clangd"
let lspDict["clangd-lsp"]["coc-ext"] = "coc-clangd"

let lspDict["go-lsp"]["exec"] = "gopls"
let lspDict["go-lsp"]["coc-ext"] = "coc-go"

let lspDict["rust-lsp"]["exec"] = "rust-analyzer"
let lspDict["rust-lsp"]["coc-ext"] = "coc-rust-analyzer"

let lspDict["python-lsp"]["exec"] = "pylsp"
let lspDict["python-lsp"]["coc-ext"] = "coc-python"

for key in keys(lspDict)
    let lspData = lspDict[key]

    if lspData['prefer-model'] is "coc" 
        if !IsCocExtPresent(lspData['coc-ext']) && executable(lspData["exec"])
            call add(cocExtsToInstall,lspData['coc-ext'])                 
        endif
    elseif lspData['prefer-model'] is "default"
        execute 'source' lspData['filePath']
    elseif lspData['prefer-model'] is "default+coc"
        if !IsCocExtPresent(lspData['coc-ext']) && executable(lspData["exec"])
            call add(cocExtsToInstall,lspData['coc-ext'])                 
        endif
        execute 'source' lspData['filePath']
    endif
endfor 

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

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nmap <silent> K :call CocActionAsync('showSignatureHelp')<CR>
