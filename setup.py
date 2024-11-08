import os
import re

plugins = {
    "coc.nvim": "neoclide/coc.nvim" ,
    "auto-pairs": "jiangmiao/auto-pairs",
    "vim-commentary": "tpope/vim-commentary",
    "vim-lsp": "prabirshrestha/vim-lsp",
    "vimwiki": "vimwiki/vimwiki",
    "vim-svelte": "evanleck/vim-svelte",
    "ctrlp.vim": "kien/ctrlp.vim"
}

AUTOSTART_FOLDER_PATH = f"{os.getenv("HOME")}/.vim/pack/vendor/start"

def find_au_plug(dir_name):
    return os.path.exists(f"{AUTOSTART_FOLDER_PATH}/{dir_name}")

def fetch_git_plug(repo,dest=AUTOSTART_FOLDER_PATH):  
    url = f"https://github.com/{repo}"
    result = re.search(r'/([^/]+)$', url)

    if result:
        repo_name = result.group(1)
        dest = f"{dest}/{repo_name}"
        os.system(f"git clone {url} {dest}")
    else:
        print("Could not find repo name.")

if __name__ == "__main__":
    if not os.path.exists(AUTOSTART_FOLDER_PATH):
        try:
            os.makedirs(AUTOSTART_FOLDER_PATH)
        except Exception as err:
            print(err)
            exit(1)

    for name in plugins:
        if not find_au_plug(name):
            fetch_git_plug(plugins[name])
