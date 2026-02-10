vim.keymap.set("n", "<leader>/", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" } }) end, { desc = "Terminal (Horizontal)" })-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
