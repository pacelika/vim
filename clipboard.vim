if has('win64') || has('win32')
    "TODO: add windows copy to clipboard support
else
    const uName = trim(system("uname"))
    if uName == "Darwin"
        vnoremap <C-c> :w !pbcopy<CR><CR>
    elseif uName == "Linux"
        vnoremap <C-c> :w !xclip -selection clipboard<CR><CR>
    endif
endif
