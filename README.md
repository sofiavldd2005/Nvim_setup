# My personal Neovim Configs

<div align="center">

![Lua](https://img.shields.io/badge/Lua-000080?style=for-the-badge&logo=lua&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![LazyVim](https://img.shields.io/badge/LazyVim-9F7AEA?style=for-the-badge&logo=neovim&logoColor=white)

Built on top of [LazyVim](https://github.com/LazyVim/LazyVim) with support for modern development workflows, embedded systems, and academic work.

[Features](#features) • [Installation](#installation) • [Configuration](#configuration) • [Keybindings](#keybindings) • [Languages](#supported-languages)

</div>

---
These are my personal configs for neovim, I have built over the time, and are subject to change over the time. I also provide some troubleshooting advice, below, for some problemm I've enconuntered.
For the configs I use when using NixOS see the nixos_neovim_cfgs :) (I removed the auto-install bootstrap)

## Features

### **Rust Development**
- **Full `rust-analyzer` integration** with code completion and refactoring
- **Automatic formatting** via `rustfmt` with custom style configurations
- **Embedded Systems Debugging** with `probe-rs` support for embedded ARM development
  - Pre-configured Embassy debugging for STM32F446RC microcontroller
  - One-command flashing and debugging workflow
  - Integrated DAP (Debug Adapter Protocol) for  breakpoint debugging

### **C, C++ & C# Development**
- **`clangd` language server** for high-fidelity code analysis and completions
- **Automatic code formatting** via `clang-format`
- **CMake integration** with one-key CMake project generation (`<leader>cg`)
- **Automatic compile_commands.json linking** for immediate clangd compiler awareness
- **Advanced Embedded Systems Debugging** via Microsoft `cpptools` (cppdbg) and OpenOCD SWD:
  - Connects seamlessly to a background OpenOCD session (`localhost:3333`)
  - Uses the official, stable STMicroelectronics-customized `arm-none-eabi-gdb` toolchain binary
  - Automatic memory flashing (`load`) and CPU execution control (`monitor reset halt`) on startup
  - Real-time live-updating **Disassembly View** buffer next to your source code

### **LaTeX & Academic Writing**
- **Live PDF preview** with `VimTeX` and `Zathura`
- **Portuguese spell checking** built-in (`pt_PT`)
- **Keyboard shortcut** for compilation and viewing (`\ll`)
- **Perfect for research papers, theses, and technical documents**

### **File Management**
- **Neo-tree sidebar** with visual file navigation
- **Hidden files and directories visible by default** for full workspace control
- **Smart directory navigation** with intuitive keybindings
- **Auto-open Neo-tree** when launching Neovim without arguments

### **Advanced Code Editing**
- **Multi-language syntax highlighting** (Python, TOML, Haskell, Bash, YAML, and more)
- **Context-aware autocompletion** via `blink.cmp` with super-tab preset
- **Spell checking integration** with `codespell` for typo detection
- **LSP-powered intellisense** across all supported languages

### **Debugging & Testing**
- **Debug Adapter Protocol (DAP)** with full visual debugging interface
- **F-key shortcuts** for debugging control:
  - `F5`: Step Into
  - `F6`: Step Over
  - `F7`: Step Out
  - `F8`: Continue/Resume
  - `F9`: Toggle Breakpoint
- **Debug REPL** for runtime variable inspection (`<leader>dr`)
- **Quick terminate** command (`<leader>dq`)

### **Performance Optimized**
- **Lazy loading** of plugins for lightning-fast startup
- **Automatic plugin updates** with change notifications
- **Minimal default plugins** loaded (unnecessary vim builtins disabled)
- **Optimized for both productivity and system resources**

---

## Installation

### Prerequisites
- Neovim >= 0.8
- Git
- `xclip` or similar clipboard manager (for system integration)

**Optional Prerequisites (for full feature support):**
- `cmake` and `ninja-build` (for CMake integration)
- `clang` and `clangd` (for C/C++ language support)
- `rustup` (for Rust toolchain)
- `texlive`, `zathura` or `skim` (for LaTeX compilation and preview)
- `openocd` and `gdb-multiarch` (for C/C++ embedded debugging)
- `probe-rs` (for Rust embedded debugging)

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

## Configuration

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

## Keybindings

### Essential Shortcuts

| Keybinding | Action | Mode |
|-----------|--------|------|
| `<leader>ft` | Toggle terminal at bottom | Normal |
| `<leader>/` | Toggle terminal (alternative) | Normal |
| `Ctrl+h` | Focus left panel (Neo-tree) | Normal |
| `Ctrl+j` | Focus bottom panel | Normal |
| `Ctrl+k` | Focus top panel | Normal |
| `Ctrl+l` | Focus right panel | Normal |
| `u` | Navigate up one directory | Neo-tree |
| `.` | Set as root directory (zoom in) | Neo-tree |
| `\ll` | Compile LaTeX & open in previewer | Normal |
| `<leader>cg` | Generate CMake project | Normal |
| `<leader>cf` | Format current buffer | Normal |
| `gd` | Go to definition | Normal |
| `gr` | Go to references | Normal |
| `K` | Hover documentation | Normal |
| `<leader>ca` | Code actions | Normal |

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
| `:DapDisasm` | Toggle real-time live-updating Disassembly View buffer |
| `-exec <cmd>` | Execute raw GDB commands in the DAP REPL (e.g. `-exec info registers`) |

### Additional Tricks

- **Split terminals horizontally**: Press `Esc`, then `:vsplit | terminal`
- **CMake project setup**: `<leader>cg` to generate build files and link compile_commands.json
- **Code formatting**: Automatic on save via `conform.nvim`

See `lua/config/keymaps.lua` for all keybindings and customization options.

---

## Supported Languages

### Out-of-the-Box LSP Support
The following languages are supported with native LSP integration, providing code completion, formatting, and diagnostics:
- **Rust** (`rust-analyzer`) - Advanced code analysis, inlay hints, and debugging support.
- **C/C++** (`clangd`) - High-fidelity completions, formatting (`clang-format`), and CMake integration.
- **LaTeX** (`texlab`) - Integrated with VimTeX for live previews and continuous compilation.
- **Lua** (`lua_ls`) - Full Neovim API awareness for configuring your editor.
- **Haskell** (`hls`) -  Sintax highlighting and completion.
- **Assembly** (`sumlari`) - Syntax highlighting and completion.
- **Python** (`pyright` or `pylsp`) - Full intellisense and virtual environment detection.
- **YAML** (`yamlls`), **TOML** (`taplo`), **Bash** (`bashls`), **JSON** (`jsonls`), **Markdown** (`marksman`) - Syntax highlighting, diagnostics, and formatting.

### Installing Additional Languages
Use `:Mason` command in Neovim to install any additional language servers or debuggers:
```vim
:Mason
```

Search for your language and press `i` to install.

---

## Key Plugins

| Plugin | Purpose | Status |
|--------|---------|--------|
| **LazyVim** | Base configuration framework | Core |
| **lazy.nvim** | Plugin manager | Core |
| **neo-tree.nvim** | File explorer sidebar | Custom |
| **nvim-dap** | Debug Adapter Protocol | Enhanced |
| **nvim-dap-disasm** | Real-time Disassembly Viewer | Custom |
| **nvim-lspconfig** | LSP configuration | Included |
| **conform.nvim** | Code formatter | Included |
| **blink.cmp** | Smart completion | Enhanced |
| **vimtex** | LaTeX support | Custom |
| **null-ls.nvim** | Additional diagnostics | Enhanced |

For a complete plugin list, run `:Lazy` in Neovim.

---

### Embedded C/C++ Debugging (STM32 + OpenOCD)
The configuration includes a professional C/C++ embedded debugger which flashes and debugs STM32 targets:

1. **Start OpenOCD** in a terminal split:
   ```bash
   openocd -f interface/stlink.cfg -f target/stm32f4x.cfg
   ```
2. **Launch Neovim**, toggle a breakpoint, and start debugging (`F5` or `<leader>dc`).
3. Select **`Debug STM32 (OpenOCD SWD)`**. Neovim will connect to OpenOCD, flash the microcontroller, and halt at `main`.
4. Run **`:DapDisasm`** to open the real-time disassembly buffer alongside your code. It will update automatically as you step through the program!

### Embedded Rust Debugging (probe-rs)
A ready-to-use Embassy debugging setup is included for STM32F446RC:

1. In `/home/sofia/.config/nvim/lua/plugins/dap.lua`, verify your microchip and binary target:
   ```lua
   chip = "STM32F446RC",
   programBinary = "${workspaceFolder}/target/thumbv7em-none-eabihf/debug/your_binary_name",
   ```
2. Press `F5` and select **`Embassy Debug (probe-rs)`**. Neovim will use `probe-rs` to flash and debug the chip in one step without needing OpenOCD in the background.

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

### Plugins not installing?
```vim
:Lazy sync
```

### LSP not working for a language?
```vim
:Mason
" Find and install the language server
```

### Ubuntu GDB "Recursive internal problem" crash?
Standard Ubuntu 24.04 GDB (`gdb-multiarch`) has an upstream bug where its native DAP server crashes over embedded target remote connections. 
To bypass this, our configuration uses Microsoft's **`cppdbg`** translation adapter (connected to your Mason `OpenDebugAD7` binary) and redirects the debugger path to the highly stable, customized **`arm-none-eabi-gdb`** bundled with STM32Cube:
```lua
miDebuggerPath = "/home/sofia/.local/share/stm32cube/bundles/gnu-gdb-for-stm32/13.3.1+st.10/bin/arm-none-eabi-gdb"
```

### GDB "Interpreter 'dap' unrecognized" error?
ST's customized `arm-none-eabi-gdb` does not have native Python/DAP interpreter support compiled in. 
This is why we use the **`cppdbg`** adapter layout, which communicates over GDB's standard Machine Interface (MI) protocol and translates it into DAP commands for Neovim without needing `-i dap`.

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

## Customization

All configurations can be customized by editing files in `~/.config/nvim/`:
- **Keybindings**: `lua/config/keymaps.lua`
- **Options**: `lua/config/options.lua`
- **Plugins**: `lua/plugins/*.lua`
- **LSP Settings**: `lua/plugins/lsp.lua`

---

## License

This configuration is licensed under the **Apache License 2.0**. See LICENSE file for details.

---

## Contributing

Feel free to fork, modify, and create pull requests! This is a personal configuration, but contributions and suggestions are welcome.

---

## Support

If you encounter issues:
1. Check [LazyVim documentation](https://www.lazyvim.org/)
2. Review [Neovim documentation](https://neovim.io/doc/user/)
3. Open an issue in this repository with details about your setup

---

**Happy coding!**

*Built with love for developers who love efficiency*

---

## AI Disclaimer

Please note that Artificial Intelligence (AI) tools were utilized to assist in the development of the documentation and the troubleshooting of various configurations within this repository.
