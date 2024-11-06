if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'tsserver',
        \ 'cmd': ['typescript-language-server', '--stdio'],
        \ 'whitelist': ['javascript', 'typescript', 'typescript.tsx'],
        \ })
endif
