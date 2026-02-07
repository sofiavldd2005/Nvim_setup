-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- To automatically show side tree
-- Open Neo-tree automatically on startup-- Force Neo-tree to open after the UI is stable
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted", -- Wait until LazyVim is fully initialized
  callback = function()
    local stats = vim.uv.fs_stat(vim.fn.getcwd())
    -- Only open if we are in a directory and not opening a specific file
    if vim.fn.argc() == 0 and stats and stats.type == "directory" then
      vim.schedule(function()
        vim.cmd("Neotree show")
      end)
    end
  end,
})
