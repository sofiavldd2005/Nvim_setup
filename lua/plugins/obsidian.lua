return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Obsidian Vault",
        path = "/home/sofia/Documents/Obsidian Vault",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    new_notes_location = "current_dir",
  },
}
