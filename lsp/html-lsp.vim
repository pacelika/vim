if executable("vscode-html-languageserver")
    if g:lspModel is "coc"
        colorscheme ron  
    else 
        au BufRead,BufNewFile *.html,*.htm,*.xhtml set filetype=html
        au FileType html call lsp#enable()

        let g:lsp_settings = {
          \ 'html': {
          \     'command': 'vscode-html-languageserver',
          \     'args': ['--stdio'],
          \     'root_uri': getcwd(),
          \     'filetypes': ['html', 'htm', 'xhtml'],
          \ },
          \ }
    endif
endif
