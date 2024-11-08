if executable('typescript-language-server')
    au FileType javascript,typescript,typescriptreact,javascriptreact,jsx,tsx call lsp#enable()
    au BufRead,BufNewFile *.jsx,*.tsx set filetype=javascriptreact

    au User lsp_setup call lsp#register_server({
        \   'name': 'tsserver',
        \   'cmd': ['typescript-language-server', '--stdio'],
        \   'filetypes': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'jsx', 'tsx'],
        \   'whitelist': ['javascript', 'typescript', 'typescript.tsx'],
        \ })
endif
