# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

My Neovim Configuration (LazyVim) :)
This is my personal Neovim setup, i usually work with C, Rust, and LaTeX development, so i started optimizing for it.

System Dependencies
Before cloning, ensure you have the following installed on your system ( I use Ubuntu :):

Compilers/LSPs: build-essential (C), rustup (Rust), and texlive-full (LaTeX).

PDF Viewer: zathura (for live LaTeX previewing).

Tools: fd-find, ripgrep (for fast searching), and latexmk.

Installation
Back up your existing config: (Skip this one if you're felling brave)

Bash

mv ~/.config/nvim ~/.config/nvim.bak
Clone this repository:

Bash

git clone https://github.com/sofiavldd2005/Nvim_setup.git ~/.config/nvim
Launch Neovim:

Bash

nvim
Lazy.nvim will automatically download and install all plugins and LSPs on the first run.

Key Highlights, i have found useful.
Sidebar: <leader>e to toggle Neo-tree. ("u" -> up one directory, "." -> down one directory)
<leader>j + t to open a terminal on the bottom.

LaTeX Preview: \ll to start live compilation and open Zathura.

Find Files: <leader><space> to search everything.

Terminal: Ctrl-/ to toggle the floating terminal.
