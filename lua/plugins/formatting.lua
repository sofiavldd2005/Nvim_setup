-- This document tells lazyvim which tools to use for formatting my files
--
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      sh = { "shfmt" }, -- This will format your .sh scripts
    },
    -- This ensures it tries the tool first, then the LSP as a backup
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Optional: uncomment the line below to format automatically on save
    -- format_on_save = { timeout_ms = 500 },
  },
}
