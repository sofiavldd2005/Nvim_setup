return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      -- This ensures that every time you open a directory,
      -- the tree is there.
      follow_current_file = { enabled = true },
    },
    -- This forces the window to stay open
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["u"] = "navigate_up", -- This explicitly maps 'u' to move up
        ["."] = "set_root", -- This is your 'zoom in' command
      },
    },
  },
  -- This is the "Force Start" logic
  init = function()
    if vim.fn.argc() == 0 then
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          vim.cmd("Neotree show")
        end,
      })
    end
  end,
}
