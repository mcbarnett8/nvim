# Neovim Config (Portable / RHEL 8 Compatible)

This is my personal Neovim configuration designed to work on **older systems (RHEL 8)** while still being portable to **Ubuntu and macOS**.

It provides a lightweight, stable setup with:
- File explorer (NERDTree)
- Fuzzy finder (fzf)
- Git integration
- Statusline (airline)
- Basic IDE-like navigation

---

## Requirements

### RHEL 8 / Rocky / Alma
```bash
sudo dnf install -y git curl ripgrep xclip nodejs npm python3-pip gcc
pip3 install --user pynvim
````

---

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install -y git curl ripgrep xclip nodejs npm python3-pip build-essential
pip3 install --user pynvim
```

---

### macOS (Homebrew)

Make sure Homebrew is installed: [https://brew.sh/](https://brew.sh/)

```bash
brew install neovim git ripgrep node python
pip3 install --user pynvim
```

---

## Install

```bash
mkdir -p ~/dotfiles
git clone <YOUR_REPO_URL> ~/dotfiles/nvim

mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Install plugins:

```bash
nvim
```

Inside Neovim:

```vim
:PlugInstall
```

---

## Keybindings

Leader key = `Space`

### File Navigation

- `<Space>e` → Toggle file tree
    
- `<Space>o` → Find current file in tree
    
- `<Space>ff` → Fuzzy find files (current dir)
    
- `<Space>fh` → Fuzzy find in home directory
    
- `<Space>fc` → Fuzzy find in nvim config
    

### Buffers

- `Shift-l` → Next buffer
    
- `Shift-h` → Previous buffer
    
- `<Space>bd` → Close buffer
    

### Window Navigation

- `Ctrl-h/j/k/l` → Move between splits
    
- `<Space>sv` → Vertical split
    
- `<Space>sh` → Horizontal split
    

### General

- `<Space>w` → Save
    
- `<Space>q` → Quit
    
- `<Space>Q` → Force quit
    
- `<Space>h` → Clear search highlight
    

### Terminal

- `<Space>tt` → Open terminal
    
- `Esc` → Exit terminal mode
    

---

## Notes

- Plugins are managed with **vim-plug**
    
- Plugin directory (`plugged/`) is ignored in git
    
- Config is written in `init.vim` (not Lua) for compatibility with older Neovim versions
    
- Designed to avoid dependencies on newer Neovim features
    

---

## Updating Plugins

Inside Neovim:

```vim
:PlugUpdate
```

---

## Known Limitations

- Not compatible with modern Neovim frameworks (NvChad, LazyVim)
    
- Node.js from some distros (RHEL) is outdated and may affect LSP features
    
- Minimal LSP setup by default (can be extended)
    

---

## Future Improvements

- Add CoC or LSP config
    
- Improve fuzzy search workflow
    
- Optional Telescope migration (if upgrading Neovim)
    

