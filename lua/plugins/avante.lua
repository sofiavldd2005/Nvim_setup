return {
  {
    "yetone/avante.nvim",
    opts = {
      -- Set Ollama as the default provider for both chat and suggestions
      provider = "ollama",
      auto_suggestions_provider = "ollama",

      -- Configure the Ollama provider
      providers = {
        ollama = {
          endpoint = "http://127.0.0.1:11434",
          model = "codellama:13b",
          -- Highly recommended: Local models sometimes struggle with Avante's
          -- advanced tool-calling features and can get stuck in a loop.
          disable_tools = true,
        },
      },
    },
  },
}
