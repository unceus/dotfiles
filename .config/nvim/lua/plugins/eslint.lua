-- pretty sure this isn't working, but without this nvim complains that lspconfig can't find ESLint library
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        -- Be explicit about the filetypes you want linted
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
          "svelte",
          "astro",
        },

        -- Force correct root: picks the *nearest* config/package.json/.git
        root_dir = function(fname)
          local u = require("lspconfig.util")
          return u.root_pattern(
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
            "eslint.config.ts",
            ".eslintrc",
            ".eslintrc.json",
            ".eslintrc.js",
            ".eslintrc.cjs",
            "package.json",
            ".git"
          )(fname)
        end,

        settings = {
          -- Set to false unless you’re actually on ESLint v9 flat config
          experimental = { useFlatConfig = false },

          workingDirectory = { mode = "auto" },
          validate = "on",
          run = "onType",
          format = true,

          -- Show a warning if the file is ignored (otherwise it’s silent)
          onIgnoredFiles = "warn",
        },

        -- Add a tiny debug to prove attach is happening
        setup = {
          eslint = function(_, opts)
            local lsp = require("lspconfig")
            local orig_on_attach = opts.on_attach
            opts.on_attach = function(client, bufnr)
              if orig_on_attach then
                orig_on_attach(client, bufnr)
              end
              vim.schedule(function()
                vim.notify("ESLint LSP attached: " .. (client.root_dir or "?"), vim.log.levels.INFO)
              end)
            end
            lsp.eslint.setup(opts)
            return true
          end,
        },
      },
    },
  },
}
