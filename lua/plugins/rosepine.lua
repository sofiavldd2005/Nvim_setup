return {
  -- 1. Install the Rosé Pine plugin
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "auto", -- 'main', 'moon', or 'dawn'
      dark_variant = "main", -- 'main', 'moon', or 'dawn'
      styles = {
        italic = true,
        transparency = false, -- Set to true if you want a transparent background
      },
    },
  },

  -- 2. Tell LazyVim to use it as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
