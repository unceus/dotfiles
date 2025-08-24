return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        elixir = { "credo" },
      },
    },
    config = function(_, opts)
      require("lint").linters_by_ft =
        vim.tbl_extend("force", require("lint").linters_by_ft or {}, opts.linters_by_ft or {})

      -- Customize credo linter to show all issue types (warnings, refactoring, design)
      local credo_linter = require("lint").linters.credo
      if type(credo_linter) == "function" then
        credo_linter = credo_linter()
      end

      -- Start with a simple configuration first
      require("lint").linters.credo = vim.tbl_extend("force", credo_linter, {
        cmd = "mix",
        args = { "credo", "--format", "json", "--all" },
        stdin = false,
      })
      -- Lint on save (like eslint_d)
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.ex", "*.exs", "mix.exs" },
        callback = function()
          require("lint").try_lint()
        end,
      })

      -- Lint when file is opened
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*.ex", "*.exs", "mix.exs" },
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
