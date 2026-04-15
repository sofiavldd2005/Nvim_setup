return {
  "lervag/vimtex",
  config = function()
    -- This ensures VimTeX doesn't interfere with your spell settings
    vim.g.vimtex_syntax_nospell_comments = 0
    -- Standard spell enable
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "pt_pt"
  end,
}
