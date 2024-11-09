function! PrettierSupportsExtension(extension) abort
  let l:prettier_output = system('prettier --help')

  if l:prettier_output =~? '\v\.' . a:extension . '\>'
    return 1 
  endif

    return 0   
endfunction

if executable("prettier")
    if g:formatOnSave is 1
        autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.css,*.json PrettierAsync
    endif

    nnoremap <leader>p :Prettier<CR>
endif
