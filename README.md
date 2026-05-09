# 💤 LazyVim Enhanced Configuration

<div align="center">

![Lua](https://img.shields.io/badge/Lua-000080?style=for-the-badge&logo=lua&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![LazyVim](https://img.shields.io/badge/LazyVim-9F7AEA?style=for-the-badge&logo=neovim&logoColor=white)

A powerful and opinionated Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim) with enhanced support for modern development workflows, embedded systems, and academic work.

[Features](#-features) • [Installation](#-installation) • [Configuration](#-configuration) • [Keybindings](#-keybindings) • [Languages](#-supported-languages)

</div>

---

## ✨ Features

### 🦀 **Rust Development** (Advanced)
- **Full `rust-analyzer` integration** with intelligent code completion and refactoring
- **Automatic formatting** via `rustfmt` with custom style configurations
- **Embedded Systems Debugging** with `probe-rs` support for embedded ARM development
  - Pre-configured Embassy debugging for STM32F446RC microcontroller
  - One-command flashing and debugging workflow
  - Integrated DAP (Debug Adapter Protocol) for seamless breakpoint debugging

### 🔧 **C/C++ Development**
- **`clangd` language server** for intelligent code analysis and completion
- **Automatic code formatting** via `clang-format`
- **CMake integration** with one-key CMake project generation (`<leader>cg`)
- **Automatic compile_commands.json linking** for seamless clangd integration

### 📐 **LaTeX & Academic Writing**
- **Live PDF preview** with `VimTeX` and `Zathura`
- **Portuguese spell checking** built-in (`pt_PT`)
- **Keyboard shortcut** for compilation and viewing (`\ll`)
- **Perfect for research papers, theses, and technical documents**

### 🎨 **File Management**
- **Neo-tree sidebar** with visual file navigation
- **Hidden files and directories visible by default** for full workspace control
- **Smart directory navigation** with intuitive keybindings
- **Auto-open Neo-tree** when launching Neovim without arguments

### ✍️ **Advanced Code Editing**
- **Multi-language syntax highlighting** (Python, TOML, Gleam, Bash, YAML, and more)
- **Context-aware autocompletion** via `blink.cmp` with super-tab preset
- **Spell checking integration** with `codespell` for typo detection
- **LSP-powered intellisense** across all supported languages

### 🐛 **Debugging & Testing**
- **Debug Adapter Protocol (DAP)** with full visual debugging interface
- **F-key shortcuts** for debugging control:
  - `F5`: Step Into
  - `F6`: Step Over
  - `F7`: Step Out
  - `F8`: Continue/Resume
  - `F9`: Toggle Breakpoint
- **Debug REPL** for runtime variable inspection (`<leader>dr`)
- **Quick terminate** command (`<leader>dq`)

### 🚀 **Performance Optimized**
- **Lazy loading** of plugins for lightning-fast startup
- **Automatic plugin updates** with change notifications
- **Minimal default plugins** loaded (unnecessary vim builtins disabled)
- **Optimized for both productivity and system resources**

---

## 📦 Installation

### Prerequisites
- Neovim >= 0.8
- Git
- `xclip` or similar clipboard manager (for system integration)
- (Optional) `cmake`, `clang`, `rustup`, `texlive` for full feature support

### Quick Start

1. **Backup your existing Neovim config** (optional but recommended)
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this repository**
   ```bash
   git clone https://github.com/sofiavldd2005/Nvim_setup.git ~/.config/nvim
   ```

3. **Launch Neovim and let it install plugins automatically**
   ```bash
   nvim
   ```

4. **Install additional language servers/debuggers** (as needed)
   ```vim
   :Mason
   ```

---

## ⚙️ Configuration

### Directory Structure
```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua        # Plugin manager setup
│   │   ├── keymaps.lua     # Custom keybindings (DAP, terminals, etc.)
│   │   ├── options.lua     # Neovim options and settings
│   │   └── autocmds.lua    # Auto commands
│   └── plugins/
│       ├── neotree.lua     # File explorer configuration
│       ├── lsp.lua         # LSP and null-ls setup
│       ├── tex.lua         # LaTeX support
│       ├── coding.lua      # Completion and coding assists
│       └── ...
├── stylua.toml             # Lua code formatter config
└── README.md
```

### Key Configuration Files

#### **LazyVim Bootstrap** (`lua/config/lazy.lua`)
- Auto-installs Lazy.nvim package manager
- Loads all plugins from the `plugins/` directory
- Lazy-loads most plugins for better startup performance
- Configures automatic update checks

#### **Custom Keymaps** (`lua/config/keymaps.lua`)
- **DAP Debugging**: F5-F9 keys for step into/over/out, continue, and breakpoints
- **Terminal**: `<leader>/` opens horizontal terminal at bottom
- **REPL**: `<leader>dr` for debug console
- **Terminate Debug**: `<leader>dq` to end debug session

#### **Plugin Customizations**
- **Neo-tree**: Custom mappings (`u` = up, `.` = zoom in), shows hidden files
- **VimTeX**: macOS Skim support, Portuguese spell checking
- **Blink.cmp**: Super-tab completion for ergonomic coding

---

## 🎮 Keybindings

### Essential Shortcuts

| Keybinding | Action | Mode |
|-----------|--------|------|
| `<leader>ft` | Toggle terminal at bottom | Normal |
| `<leader>/` | Toggle terminal (alternative) | Normal |
| `Ctrl+h` | Focus left panel (Neo-tree) | Normal |
| `Ctrl+l` | Focus right panel (file) | Normal |
| `u` | Navigate up one directory | Neo-tree |
| `.` | Set as root directory (zoom in) | Neo-tree |
| `\ll` | Compile LaTeX & open in Zathura | Normal |

### Debugging Keybindings (DAP)

| Keybinding | Action |
|-----------|--------|
| `F5` | Step Into function |
| `F6` | Step Over (next line) |
| `F7` | Step Out (exit function) |
| `F8` | Continue/Resume execution |
| `F9` | Toggle breakpoint on current line |
| `<leader>dr` | Open debug REPL console |
| `<leader>dq` | Terminate debug session |

### Additional Tricks

- **Split terminals horizontally**: Press `Esc`, then `:vsplit | terminal`
- **CMake project setup**: `<leader>cg` to generate build files and link compile_commands.json
- **Code formatting**: Automatic on save via `conform.nvim`

See `lua/config/keymaps.lua` for all keybindings and customization options.

---

## 🗣️ Supported Languages

### Out-of-the-Box LSP Support
- **Rust** (`rust-analyzer`) - Advanced with debugger
- **C/C++** (`clangd`) - Advanced with formatter
- **LaTeX** (`texlab`) - With live preview
- **Lua** (`lua_ls`) - With vim global awareness
- **Gleam** (`gleam`) - Functional programming
- **Python** - Full intellisense
- **YAML**, **TOML**, **Bash** - Syntax highlighting & linting

### Installing Additional Languages
Use `:Mason` command in Neovim to install any additional language servers or debuggers:
```vim
:Mason
```

Search for your language and press `i` to install.

---

## 🔌 Key Plugins

| Plugin | Purpose | Status |
|--------|---------|--------|
| **LazyVim** | Base configuration framework | Core |
| **lazy.nvim** | Plugin manager | Core |
| **neo-tree.nvim** | File explorer sidebar | Custom |
| **nvim-dap** | Debug Adapter Protocol | Enhanced |
| **nvim-lspconfig** | LSP configuration | Included |
| **conform.nvim** | Code formatter | Included |
| **blink.cmp** | Smart completion | Enhanced |
| **vimtex** | LaTeX support | Custom |
| **null-ls.nvim** | Additional diagnostics | Enhanced |

For a complete plugin list, run `:Lazy` in Neovim.

---

## 🚀 Advanced Usage

### Embedded Rust Debugging
The configuration includes a ready-to-use Embassy debugging setup for STM32F446RC:

```lua
-- In init.lua, modify the `chip` and `programBinary` fields to match your setup:
chip = "STM32F446RC",  -- Your microcontroller chip
programBinary = "${workspaceFolder}/target/thumbv7em-none-eabihf/debug/your_binary_name",
```

### CMake C/C++ Projects
Generate CMake build files and configure clangd in one keystroke:

```vim
<leader>cg  " Runs CMake and links compile_commands.json
```

### LaTeX Workflow
Write, compile, and preview LaTeX documents seamlessly:

```vim
\ll  " Compile and open preview in Zathura
```

---

## 🛠️ Troubleshooting

### Plugins not installing?
```vim
:Lazy sync
```

### LSP not working for a language?
```vim
:Mason
" Find and install the language server
```

### Debug adapter not found?
Ensure `probe-rs` is installed in your Rust toolchain:
```bash
cargo install probe-rs
```

### LaTeX preview not showing?
On macOS, ensure `skim` is installed. On Linux, ensure `zathura` is installed:
```bash
# macOS
brew install skim

# Linux
sudo apt install zathura zathura-pdf-poppler
```

---

## 📝 Customization

All configurations can be customized by editing files in `~/.config/nvim/`:
- **Keybindings**: `lua/config/keymaps.lua`
- **Options**: `lua/config/options.lua`
- **Plugins**: `lua/plugins/*.lua`
- **LSP Settings**: `lua/plugins/lsp.lua`

---

## 📄 License

This configuration is licensed under the **Apache License 2.0**. See LICENSE file for details.

---

## 🤝 Contributing

Feel free to fork, modify, and create pull requests! This is a personal configuration, but contributions and suggestions are welcome.

---

## 🙋 Support

If you encounter issues:
1. Check [LazyVim documentation](https://www.lazyvim.org/)
2. Review [Neovim documentation](https://neovim.io/doc/user/)
3. Open an issue in this repository with details about your setup

---

**Happy coding! 🚀**

*Built with ❤️ for developers who love efficiency*
