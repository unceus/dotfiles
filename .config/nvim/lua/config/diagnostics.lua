vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" }, -- inline text
  signs = true, -- gutter icons
  underline = true,
  update_in_insert = true, -- show while typing
  severity_sort = true,
})

-- Optional nice icons:
local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
