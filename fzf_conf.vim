nnoremap <space>f :Files<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.zig-cache" --glob "!zig-out" --glob "!.git" --glob "!node_modules"'
