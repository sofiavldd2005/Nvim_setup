-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Function to run CMake and generate compile_commands.json
local function cmake_generate()
  local cmd = "!cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
  vim.api.nvim_command(cmd)

  -- Automatically symlink it to root so clangd sees it immediately
  os.execute("ln -sf build/compile_commands.json .")
  print("CMake: Project generated and compile_commands.json linked.")
end

-- Map it to a key
vim.keymap.set("n", "<leader>cg", cmake_generate, { desc = "CMake Generate Project" })
vim.lsp.enable("gleam")

local dap = require("dap")

-- 1. Define the adapter
dap.adapters["probe-rs-debug"] = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.expand("$HOME/.cargo/bin/probe-rs"),
    args = { "dap-server", "--port", "${port}" },
  },
}

-- 2. Ensure the rust configuration table exists
dap.configurations.rust = dap.configurations.rust or {}

-- 3. FORCE insert our custom config into the list
table.insert(dap.configurations.rust, {
  name = "Embassy Debug (probe-rs)",
  type = "probe-rs-debug",
  request = "launch",
  cwd = "${workspaceFolder}",
  chip = "STM32F413ZHT", -- Double check this is your exact chip!
  flashingConfig = {
    flashingEnabled = true,
    resetAfterFlashing = true,
    haltAfterReset = true,
  },
  coreConfigs = {
    {
      coreIndex = 0,
      -- Make sure this binary name matches your Cargo.toml!
      programBinary = "${workspaceFolder}/target/thumbv7em-none-eabihf/debug/r_d_inclita_sofware",
    },
  },
})

vim.opt.termguicolors = true

-- LaTeX configuration for VimTeX : MACOs
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_view_skim_sync = 1
