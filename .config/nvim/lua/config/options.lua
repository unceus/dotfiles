-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ""
vim.opt.relativenumber = false
vim.opt.laststatus = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append({ I = false })
vim.o.updatetime = 250
vim.o.wrap = true
vim.g.lazyvim_prettier_needs_config = false

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

vim.diagnostic.enable(true)
vim.diagnostic.config({
  virtual_text = { severity = { min = vim.diagnostic.severity.HINT } },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Strip carriage returns from clipboard paste
vim.keymap.set("i", "<C-r>+", function()
  return vim.fn.substitute(vim.fn.getreg("+"), "\r", "", "g")
end, { expr = true })

-- Optional: make middle mouse pastes always come from CLIPBOARD and strip \r
vim.keymap.set("n", "<MiddleMouse>", function()
  vim.opt.paste = true
  vim.api.nvim_paste(vim.fn.substitute(vim.fn.getreg("+"), "\r", "", "g"), true, -1)
  vim.opt.paste = false
end, { silent = true })

vim.keymap.set("i", "<MiddleMouse>", function()
  return vim.fn.substitute(vim.fn.getreg("+"), "\r", "", "g")
end, { expr = true })

-- Paste system clipboard as Markdown (tries HTML->GFM via pandoc, falls back to plain text)
local function paste_markdown()
  local has = vim.fn.has
  local read_cmd

  if has("mac") == 1 then
    read_cmd = "pbpaste"
  elseif has("win32") == 1 then
    read_cmd = 'powershell -NoProfile -Command "Get-Clipboard -Raw"'
  elseif os.getenv("WAYLAND_DISPLAY") then
    read_cmd = "wl-paste" -- no --type here; we want the raw text
  else
    read_cmd = "xclip -selection clipboard -o"
  end

  -- Read clipboard as plain text
  local raw = vim.fn.systemlist(read_cmd)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("Clipboard read failed")
    return
  end

  -- Write to a temp file so Pandoc can read it
  local tmp = vim.fn.tempname()
  vim.fn.writefile(raw, tmp)

  -- Try HTML -> GitHub-Flavored Markdown
  local md = vim.fn.systemlist(string.format('pandoc -f html -t gfm "%s"', tmp))

  -- Clean up temp file
  pcall(vim.fn.delete, tmp)

  -- If pandoc failed or produced nothing, just paste raw text
  local out = (vim.v.shell_error == 0 and #md > 0) and md or raw
  vim.api.nvim_put(out, "c", true, true)
end

vim.keymap.set("n", "<leader>mp", paste_markdown, { desc = "Paste clipboard as Markdown (HTML→MD)" })
