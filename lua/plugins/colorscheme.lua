return {
  -- Configure Tokyonight for max vividness
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "storm", -- options: storm, moon, night, day
      transparent = true, -- Optional: lets your Alacritty background shine through!
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
