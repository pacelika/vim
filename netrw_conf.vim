let g:netrw_hide = 1
let g:netrw_fastbrowse = 2
let g:netrw_liststyle = 3

if has("win32") || has("win64")
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.zig-cache\(/\|\s*$\)'
else
    let g:netrw_list_hide = '\.zig-cache$,\v\.git$'
endif
