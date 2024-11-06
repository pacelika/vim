if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
     \ 'name': 'rust-analyzer',
     \ 'cmd': {server_info->['rust-analyzer']},
     \ 'allowlist': ['rust'],
     \ })

    if exists(':LspStart')
      augroup lsp_rust
        autocmd!
        autocmd FileType rust LspStart rust-analyzer
      augroup END
    endif

    let g:lsp_settings = {
      \ 'rust-analyzer': {
      \   'cmd': ['rust-analyzer'],
      \   'filetypes': ['rust'],
      \ },
    \ }
endif

