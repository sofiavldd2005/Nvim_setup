return {
  -- 1. Setup Luarocks to compile the magick dependency
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Ensures it runs before image.nvim
    opts = {
      rocks = { "magick" },
    },
  },

  -- 2. Setup the image renderer
  {
    "3rd/image.nvim",
    dependencies = { "vhyrro/luarocks.nvim" },
    opts = {
      -- Change this to "wezterm" if you use WezTerm instead of Kitty!
      backend = "kitty",
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },

  -- 3. Setup the diagram generator
  {
    "3rd/diagram.nvim",
    dependencies = { "3rd/image.nvim" },
    opts = {
      renderer_options = {
        mermaid = {
          background = "transparent",
          theme = "dark",
        },
        plantuml = {
          enabled = false,
        },
      },
    },
  },
}
