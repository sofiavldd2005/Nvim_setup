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
