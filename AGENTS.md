# AGENTS.md — Neovim Config

This is a personal Neovim config built on **LazyVim**. Every plugin file in `lua/plugins/` is a lazy.nvim spec table returned directly — LazyVim merges them with its defaults via `opts` / `opts = function()`.

## Entry point

`init.lua` → `require("config.lazy")` → lazy.nvim bootstraps, loads `LazyVim/LazyVim`, then imports `lua/plugins/*`.

## Archetype: LazyVim distribution

Most language support is defined in [`lazyvim.json`](lazyvim.json) as LazyVim extras, **not** in `lua/plugins/`. Extras in use: dap.core, clangd, cmake, git, haskell, json, markdown, python, ruby, rust, sql, toml, yaml, alpha, dashboard-nvim, edgy, dot.

If adding a new language: prefer enabling a LazyVim extra over writing a new plugin spec. Check available extras at `:LazyExtras`.

## Surprising / non-obvious

- **Dashboard**: Uses `nvimdev/dashboard-nvim` (mimics Alpha API internally) **not** `alpha-nvim`. Config code calls `require("alpha.themes.dashboard")` — that's the dashboard-nvim compat layer, not an error.
- **Colorscheme**: `tokyonight` is the LazyVim colorscheme but `vim.g.colors_name = "catppuccin"` is set in [`lazy.lua`](lua/config/lazy.lua#L55). Catppuccin is the *de facto* theme. If both are missing, lazy.nvim falls back to `"habamax"` (install colorscheme list).
- **`termguicolors` conflict**: [`init.lua`](init.lua#L19) sets `true`, [`options.lua`](lua/config/options.lua#L11) sets `false`. `options.lua` wins (loaded earlier by LazyVim lifecycle). Intentional — terminal emulator theme passthrough.
- **GDB workaround**: Ubuntu 24.04 `gdb-multiarch` has a DAP bug over remote connections. This config **never uses it**. Instead it uses STM32Cube's bundled `arm-none-eabi-gdb` at a hardcoded path (`~/.local/share/stm32cube/bundles/gnu-gdb-for-stm32/13.3.1+st.10/bin/arm-none-eabi-gdb`) with Microsoft's `cppdbg` adapter (Mason `OpenDebugAD7`). The ST GDB lacks Python/DAP support — `cppdbg` works around this by communicating over GDB MI protocol.
- **DAP is entirely custom** — not a LazyVim spec override. It registers adapters and configurations directly in [`dap.lua`](lua/plugins/dap.lua) via `require("dap").adapters.*` and `require("dap").configurations.*`. Two debug targets: (1) "Debug STM32 (OpenOCD SWD)" for C/C++, (2) "Embassy Debug (probe-rs)" for Rust. Both have hardcoded paths and chip names.
- **`example.lua`** returns `{}` early (line 3: `if true then return {} end`). It's a reference spec, not loaded.
- **`lazy-lock.json`** is in `.gitignore` and NOT tracked in git (was removed in bd148b8). Do not commit it.
- **Neo-tree auto-open** is duplicated: both [`autocmds.lua`](lua/config/autocmds.lua#L12-L23) (LazyVimStarted event) and [`neotree.lua`](lua/plugins/neotree.lua#L27-L35) init (VeryLazy event). The autocmds.lua version has directory-only guarding; the neotree.lua version does not. Both fire — neotree.lua's fires first.
- **VimTeX config is split** across [`init.lua`](init.lua#L22-L24) (Skim view method), [`options.lua`](lua/config/options.lua#L8) (Zathura view method — overrides init.lua), and [`tex.lua`](lua/plugins/tex.lua) (spell settings). The options.lua value wins at runtime.

## Commands

- `nvim` — auto-installs lazy.nvim and plugins on first launch
- `:Lazy` — plugin manager UI
- `:Lazy sync` — force plugin sync if anything fails to install
- `:Mason` — LSP / DAP installer UI (`i` to install)
- Formatting via `<leader>cf` or conform.nvim defaults — configured in [`formatting.lua`](lua/plugins/formatting.lua)
- `<leader>cg` — CMake generate + `compile_commands.json` symlink (from [`init.lua`](init.lua#L15))

## Debug shortcuts (DAP)

| Key | Action |
|---|---|
| `<F5>` | Step Into |
| `<F6>` | Step Over |
| `<F7>` | Step Out |
| `<F8>` | Continue |
| `<F9>` | Toggle breakpoint |
| `<leader>dr` | Toggle REPL |
| `<leader>dq` | Terminate + close UI |

## LSP

Primarily via LazyVim extras + Mason. Explicit server configs are minimal:
- [`options.lua`](lua/config/options.lua#L10): `lua_ls` gets `vim` global diagnostic setting
- [`init.lua`](init.lua#L16): `vim.lsp.enable("gleam")` for Gleam
- Extra: `clangd_extensions.nvim` is a dependency but no explicit config
- Linting via `nvim-lint` with `codespell` as a global linter — see [`lint.lua`](lua/plugins/lint.lua)

## OpenCode (AI assistant)

- `<leader>aa` — ask (`@this:` scope, auto-submit)
- `<leader>ax` — actions menu
- `<leader>at` — toggle panel
- Uses Snacks picker integration for context-aware sending (`<M-a>` in picker)

## Stylua (Lua formatter)

[`stylua.toml`](stylua.toml): spaces, 2-width indent, 120 column width.
