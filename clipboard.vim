if has('win64') || has('win32')
    "TODO: add windows copy to clipboard support
else
    const uName = trim(system("uname"))
    if uName == "Darwin"
        vnoremap <C-c> :w !pbcopy<CR><CR>
        set clipboard=unnamed
    elseif uName == "Linux"
        vnoremap <C-c> :w !xclip -selection clipboard<CR><CR>
        set clipboard=unnamedplus
    endif
endif
