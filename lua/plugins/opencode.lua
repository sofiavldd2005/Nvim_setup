return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      {
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {},
          picker = {
            actions = {
              opencode_send = function(...)
                return require("opencode").snacks_picker_send(...)
              end,
            },
            -- configure picker window keymaps for OpenCode integration
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
      {
        "folke/which-key.nvim", -- registers <leader>a as OpenCode group label
        opts = {
          spec = {
            { "<leader>a", group = "OpenCode" },
          },
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "Ask OpenCode",
      },
      {
        "<leader>ax",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "OpenCode actions",
      },
      {
        "<leader>at",
        function()
          require("opencode").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle OpenCode",
      },
    },
    config = function()
      vim.g.opencode_opts = {}
      vim.o.autoread = true
    end,
  },
}
