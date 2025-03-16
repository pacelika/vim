nnoremap <space>f :Files<CR>

if has('win32') || has('win64')
    " let $FZF_DEFAULT_COMMAND = 'where /r . * 2>nul | findstr /v /c:"\\node_modules\\" /c:"\\.git\\" /c:"\\target\\" /c:"\\build\\"'
else
    let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude node_modules --exclude target --exclude bin'
endif
