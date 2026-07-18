return {
  "lervag/vimtex",
  config = function()
    -- View method: "zathura" on Linux, change to "skim" on macOS
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_view_skim_sync = 1
    -- This ensures VimTeX doesn't interfere with your spell settings
    vim.g.vimtex_syntax_nospell_comments = 0
    -- Standard spell enable
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "pt_pt"
  end,
}
