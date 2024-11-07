function! FindEslintConfig(dir)
    if filereadable(a:dir . '.eslintrc')
        return a:dir . '.eslintrc'
    elseif filereadable(a:dir . '.eslintrc.json')
        return a:dir . '.eslintrc.json'
    elseif filereadable(a:dir . '.eslintrc.js')
        return a:dir . '.eslintrc.js'
    elseif filereadable(a:dir . '.eslintrc.cjs')
        return a:dir . '.eslintrc.cjs'
    elseif filereadable(a:dir . '.eslintrc.yaml')
        return a:dir . '.eslintrc.yaml'
    elseif filereadable(a:dir . '.eslintrc.yml')
        return a:dir . '.eslintrc.yml'
    else
        return ''
    endif
endfunction

let s:configLocation = FindEslintConfig(getcwd() . '/')

if s:configLocation is ''
    let s:configLocation = FindEslintConfig(expand("~") . '/')
endif

if executable('diagnostic-languageserver') && s:configLocation isnot ''
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
        \       'args': ['-c',s:configLocation, '-f', 'json', '--stdin', '--stdin-filename', '%filepath'],
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

