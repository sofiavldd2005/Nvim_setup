# 💤 LazyVim

My Personal Neovim configs built on top of [LazyVim](https://github.com/LazyVim/LazyVim) :)

The features i found important

**Rust** Full `rust-analyzer` integration with automatic formatting via `rustfmt`
I Like to do embedded programing in rust, and for debuging i use `probe-rs` which you'll also find configured :).

**C** I have the `clangd` and `clang-format` plugins

**Latex** Live preview with `VimTeX` and `Zathura`

**neotree** Pretty sidebar tree for file management with hiden files shown

I also have sintax highlighting and autocomplete, for Python, TOML, Gleam, Bash and YAML.

## How you can use my setup :)

1. Backup your existing config (skip this one if you're feeling brave)
```Bash
mv ~/.config/nvim ~/.config/nvim.bak
```
2. Clone the repo

```Bash
git clone [https://github.com/sofiavldd2005/Nvim_setup.git](https://github.com/sofiavldd2005/Nvim_setup.git) ~/.config/nvim
```
3. Lastly launch Neovim

```Bash
nvim
```


## Config details

**Formaters** Managed by `conform.nvim`

**neotree** The config is inside the `neotree.lua` file

**Package manager** use :Lazy to manage updates

**LSP Manager** use :Mason to install new language servers and debuggers

## Usefull shortcuts because nvim is full of confusing shortcuts 
See the `keymaps.lua` file
1. New terminal at the botton : `<leader>ft`
2. Switch between neotree and files : `Ctrl h ` and `Ctrl l`
3. Go up\down one level in directoriews : `u`\ `.`
4. Have two terminals, split horizontal : `Esc ` and then `:vsplit | terminal`
5. To start live compilation and open Zathura : `\ll`
6. Keybinds, like using F5, F9, F10, F10 for debugging using `probe-rs`





