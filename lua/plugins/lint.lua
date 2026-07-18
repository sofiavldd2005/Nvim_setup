return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      -- Run codespell on all filetypes as a general typo checker
      ["*"] = { "codespell" },
    },
  },
}
