if executable('nimlangserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'nimlangserver',
        \ 'cmd': {server_info->['nimlangserver']},
        \ 'allowlist': ['nim','nims','nimble'],
        \ })
endif
