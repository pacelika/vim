nnoremap <space>f :Files<CR>

let g:fzf_preview_window = []

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore --glob "!.zig-cache" --glob "!zig-out" --glob "!.git" --glob "!node_modules" --color=never --no-messages'
