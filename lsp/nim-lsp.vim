if executable('nimlsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'nimlsp',
        \ 'cmd': {server_info->['nimlsp']},
        \ 'allowlist': ['nim','nims','nimble'],
        \ })
endif
