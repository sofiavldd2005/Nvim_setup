return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtin.diagnostics.codespell, -- Great for common typos
      -- or use cspell for more robust dictionary support
    })
  end,
}
