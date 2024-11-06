function! FindEslintConfig()
    if filereadable(getcwd() . '/.eslintrc.js')
        return getcwd() . '/.eslintrc.js'
    elseif filereadable(getcwd() . '/.eslintrc.cjs')
        return getcwd() . '/.eslintrc.cjs'
    elseif filereadable(getcwd() . '/.eslintrc.json')
        return getcwd() . '/.eslintrc.json'
    else
        return ''
    endif
endfunction

if executable('diagnostic-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'diagnosticls',
        \ 'cmd': ['diagnostic-languageserver', '--stdio'],
        \ 'whitelist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
        \ 'initialization_options': {
        \   'linters': {
        \     'eslint': {
        \       'command': 'eslint',
        \       'rootPatterns': ['.git', '.eslintrc.js', '.eslintrc.cjs','.eslintrc.json'],
        \       'debounce': 100,
        \       'args': ['-c',FindEslintConfig(), '-f', 'json', '--stdin', '--stdin-filename', '%filepath'],
        \       'sourceName': 'eslint',
        \       'parseJson': {
        \         'errorsRoot': '[0].messages',
        \         'line': 'line',
        \         'column': 'column',
        \         'endLine': 'endLine',
        \         'endColumn': 'endColumn',
        \         'message': '[eslint] ${message} [${ruleId}]',
        \       },
        \       'securities': {
        \         '2': 'error',
        \         '1': 'warning'
        \       },
        \     },
        \   },
        \   'filetypes': {
        \     'javascript': 'eslint',
        \     'javascriptreact': 'eslint',
        \     'typescript': 'eslint',
        \     'typescriptreact': 'eslint'
        \   },
        \ },
    \ })
endif

