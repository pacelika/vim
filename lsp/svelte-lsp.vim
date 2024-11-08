if executable('svelteserver')
    call lsp#register_server({
        \ 'name': 'svelte',
        \ 'cmd': ['svelteserver', '--stdio'],
        \ 'allowlist': ['*.svelte'],
        \ })
endif
