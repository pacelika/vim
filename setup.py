import os
import re
import sys

plugins = {
    "vimwiki": "vimwiki/vimwiki",
    "auto-pairs": "jiangmiao/auto-pairs",
    "vim-commentary": "tpope/vim-commentary",

    "vim-lsp": "prabirshrestha/vim-lsp",
    "YouCompleteMe": "ycm-core/YouCompleteMe",
    "vim-prettier": "prettier/vim-prettier",

    "fzf": "junegunn/fzf",
    "fzf.vim": "junegunn/fzf.vim",
    "vim-tmux-navigator": "christoomey/vim-tmux-navigator",

    "vim-scarpet" : "twh2898/vim-scarpet"
}

AUTOSTART_FOLDER_PATH = f"{os.getenv("HOME")}/.vim/pack/plugins/start"

def find_au_plug(dir_name):
    return os.path.exists(f"{AUTOSTART_FOLDER_PATH}/{dir_name}")

def get_git_url(url):
    if url.startswith("https:github.com"):
        url = f"{url}"     
    elif not (url in "github.com"):
        url = f"https://github.com/{url}"
    else:
        return None

    return url

def fetch_git_plug(repo,dest=AUTOSTART_FOLDER_PATH):  
    url = get_git_url(repo)

    if url == None:
        print(f"Could not parse url. What: {url}")
        exit(1)

    result = re.search(r'/([^/]+)$', url)

    if result:
        repo_name = result.group(1)
        dest = f"{dest}/{repo_name}"
        os.system(f"git clone {url} {dest}")
    else:
        print(f"Could not parse repo name. What: {repo}")
        exit(1)

def main():
    did_action = False

    if not os.path.exists(AUTOSTART_FOLDER_PATH):
        try:
            os.makedirs(AUTOSTART_FOLDER_PATH)
            print(f"-- Creating folders for autostart plugins: {AUTOSTART_FOLDER_PATH}")
            did_action = True
        except Exception as err:
            print(err)
            return 1

    for name in plugins:
        if not find_au_plug(name):
            print(f"-- Cloning {name} from {get_git_url(plugins[name])}");
            did_action = True
            fetch_git_plug(plugins[name])
    if os.path.exists(f"{AUTOSTART_FOLDER_PATH}/YouCompleteMe") and not os.path.exists(f"{AUTOSTART_FOLDER_PATH}/YouCompleteMe/third_party/ycmd/build.py"):
        prompt_result = input("YouCompleteMe is not built, should I do build it: (y) yes, (n) no\n")

        if prompt_result != None and prompt_result.isnumeric():
            print(f"Invalid input: '{prompt_result}'")
            exit(main())

        if prompt_result == "y" or prompt_result == "yes" or prompt_result == "":
            print("-- Building YouCompleteMe...")
            os.system(f"cd {AUTOSTART_FOLDER_PATH}/YouCompleteMe; git submodule update --init --recursive")
            os.system(f"cd {AUTOSTART_FOLDER_PATH}/YouCompleteMe; python3 install.py --all")
            os.system(f"cd {AUTOSTART_FOLDER_PATH}/YouCompleteMe; python3 install.py --clangd-completer")
            if not ("-noclear" in sys.argv):
                pass
            print("-- Installed YouCompleteMe")
            return 0

    if not did_action:
        print("-- Nothing to run. All good!")
    return 0

if __name__ == "__main__":
    exit(main())
