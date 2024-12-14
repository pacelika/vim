let g:ale_warn_about_trailing_whitespace = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ["flake8"],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:ale_c_clangtidy_checks = [
            \ '-clang-diagnostic-error',
            \ '-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling',
            \ '-clang-analyzer-security.insecureAPI.strcpy'
            \]

autocmd FileType asm let b:ale_enabled = 0
nnoremap <space><return> :ALECodeAction<cr>
map <A-s> :ALECodeAction<cr>
