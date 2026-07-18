return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- =====================================================================
      -- SECTION A: C / STM32 cppdbg Debugger Setup (using cpptools)
      -- =====================================================================

      -- 1. Register the Microsoft cpptools DAP Adapter
      -- It communicates with GDB using the standard Machine Interface (MI) protocol
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/home/sofia/.local/share/nvim/mason/bin/OpenDebugAD7",
      }

      -- 2. Map Debug Configuration for C Files
      dap.configurations.c = {
        {
          name = "Debug STM32 (OpenOCD SWD)",
          type = "cppdbg",
          request = "launch",
          cwd = "${workspaceFolder}",
          -- Automatically resolve the ELF binary compiled in our build directory
          program = function()
            return vim.fn.getcwd() .. "/build/Eletro_Software_Amalia"
          end,
          externalConsole = false,
          MIMode = "gdb",
          -- Path to the stable ST-customized GDB binary
          miDebuggerPath = "/home/sofia/.local/share/stm32cube/bundles/gnu-gdb-for-stm32/13.3.1+st.10/bin/arm-none-eabi-gdb",
          -- Address of your background OpenOCD session
          miDebuggerServerAddress = "localhost:3333",
          -- Commands sent to GDB *before* remote connection (local initialization)
          setupCommands = {
            {
              text = "file " .. vim.fn.getcwd() .. "/build/Eletro_Software_Amalia",
              description = "load symbol file",
              ignoreFailures = false,
            },
          },
          -- Commands sent to GDB *after* remote connection to OpenOCD has been established
          postRemoteConnectCommands = {
            {
              text = "monitor reset halt",
              description = "reset and halt the microcontroller",
              ignoreFailures = false,
            },
            {
              text = "load",
              description = "flash the binary to the chip",
              ignoreFailures = false,
            },
            {
              text = "monitor reset halt",
              description = "reset after flashing",
              ignoreFailures = false,
            },
          },
        },
      }

      -- =====================================================================
      -- SECTION B: Rust / Embassy Debugger Setup (probe-rs)
      -- =====================================================================

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
        chip = "STM32FH755ZITx", -- Double check this is your exact chip!
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

      -- =====================================================================
      -- SECTION C: LazyVim Breakpoint Icons / Signs
      -- =====================================================================
      if LazyVim and LazyVim.config and LazyVim.config.icons and LazyVim.config.icons.dap then
        for name, sign in pairs(LazyVim.config.icons.dap) do
          sign = type(sign) == "table" and sign or { sign }
          vim.fn.sign_define(
            "Dap" .. name,
            { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
          )
        end
      end
    end,
  },

  -- =====================================================================
  -- SECTION D: Real-time Disassembly Viewer Plugin
  -- =====================================================================
  {
    "https://codeberg.org/Jorenar/nvim-dap-disasm",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },
}
