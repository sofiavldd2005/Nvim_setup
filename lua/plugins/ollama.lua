return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "ollama",
      vendors = {
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "qwen-coder-long",
        },
      },
      behaviour = {
        auto_suggestions = false,
      },
    },
  },
}
