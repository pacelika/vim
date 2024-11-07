let s:extensions = ["js","mjs","cjs","ts","mts","cts","json","yaml","yml"]
let s:filename = ".eslintrc"
let s:dirsToLook = [getcwd().'/',expand("~").'/']

function! FindEslintConfig(dir)
    for ext in s:extensions
        if filereadable(a:dir . s:filename . "." . ext)
            return a:dir . s:filename . "." . ext
        endif
    endfor

    if filereadable(a:dir . s:filename)
        return a:dir . s:filename
    endif

    return v:null
endfunction

let s:configLocation = v:null

for loc in s:dirsToLook
    let s:configLocation = FindEslintConfig(loc)

    if s:configLocation isnot 0 && s:configLocation isnot v:null
        break 
    endif
endfor

if executable('diagnostic-languageserver') && s:configLocation isnot v:null
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

