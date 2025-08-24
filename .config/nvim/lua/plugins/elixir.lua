return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {

        elixirls = {
          root_dir = require("lspconfig.util").root_pattern("mix.exs", ".git"),
          cmd = { vim.fn.expand("~/.scripts/elixir-ls-v0.29.3/language_server.sh") },
          -- (keep your root_dir override if you added one for umbrella)
          settings = {
            elixirLS = {
              dialyzerEnabled = true, -- 🔑 enable deeper analysis
              fetchDeps = true, -- let it fetch deps for PLTs
              suggestSpecs = true, -- surface @spec suggestions
              mixEnv = "dev",
            },
          },
          cmd_env = { PATH = vim.fn.getenv("PATH") },
        },
      },
    },
  },
}
