return {
  "hrsh7th/nvim-cmp",
  optional = true,
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "luasnip",
      group_index = 1,
      priority = 100,
    })
  end,
}
