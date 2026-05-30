vim.keymap.set("n", "<leader>/", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom" } })
end, { desc = "Terminal (Horizontal)" }) -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- ==========================================
-- Debugging (DAP) Keymaps
-- ==========================================

-- F8: Start or Continue execution
vim.keymap.set("n", "<F8>", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })

-- F6: Step Over (Execute current line, don't go into functions)
vim.keymap.set("n", "<F6>", function()
  require("dap").step_over()
end, { desc = "DAP: Step Over" })

-- F5: Step Into (Go inside the function call on the current line)
vim.keymap.set("n", "<F5>", function()
  require("dap").step_into()
end, { desc = "DAP: Step Into" })

-- F7: Step Out (Finish the current function and jump back out)
vim.keymap.set("n", "<F7>", function()
  require("dap").step_out()
end, { desc = "DAP: Step Out" })

-- F9: Toggle Breakpoint (Drop a stop-sign on the current line)
vim.keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })

-- Optional: Open the REPL (Debug Console) to inspect variables
vim.keymap.set("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "DAP: Toggle REPL" })

-- <leader>dq Terminate the session and close the UI
vim.keymap.set("n", "<leader>dq", function()
  -- 1. Stop the debugger
  require("dap").terminate()

  -- 2. Close the built-in REPL
  require("dap").repl.close()

  -- 3I. (Optional) If you are using the 'nvim-dap-ui' plugin, uncomment the line below to close it:
  require("dapui").close()

  print("Debug session terminated.")
end, { desc = "DAP: Terminate & Close UI" })


