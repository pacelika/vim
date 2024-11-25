if executable('omnisharp')
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'omnisharp',
    \ 'cmd': ['omnisharp', '--languageserver', '--hostPID', getpid()],
    \ 'whitelist': ['cs'],
    \ })
endif
