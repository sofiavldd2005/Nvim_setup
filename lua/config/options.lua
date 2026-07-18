-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
--
-- Forces Neovim to respect your terminal emulator's theme (not hard-code it)
vim.opt.termguicolors = false

--This tells the Lua LSP that 'vim' is a global variable
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
