if executable('zls')
    let g:lsp_servers = {
        \ 'zig': {
         \   'comamnd': 'zls',
         \   'filetypes': ['zig'],
         \   'rootPatterns': ['build.zig']
        \ },
    \ }
endif

let g:lsp_automatic_setup = 1
