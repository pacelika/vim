let g:netrw_hide = 1
" let g:netrw_liststyle = 3

if has("win32") || has("win64")
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.zig-cache\(/\|\s*$\)'
    let g:netrw_hide = 1
else
    let g:netrw_list_hide = '\.zig-cache$,\v\.git$'
endif
