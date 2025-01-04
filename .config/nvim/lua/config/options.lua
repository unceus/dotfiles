-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ""
vim.opt.relativenumber = false
vim.opt.laststatus = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append({ I = false })
vim.o.updatetime = 250

-- Show line diagnostics automatically in hover window - https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})
