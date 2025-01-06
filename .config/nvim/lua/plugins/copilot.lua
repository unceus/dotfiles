return {
  "zbirenbaum/copilot-cmp",
  config = function(_, opts)
    local cmp = require("copilot_cmp")

    cmp.setup({
      sources = {
        -- Copilot Source
        { name = "avante_mentions", group_index = 2 },
        --{ name = "copilot", group_index = 2 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
      },
    })

    LazyVim.lsp.on_attach(function()
      cmp._on_insert_enter({})
    end, "copilot")
  end,
}
