-- vim.api.nvim_set_keymap("n", "<Leader>ww", ":w<cr>", {})

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.api.nvim_del_keymap("n", "<Leader><space>")
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>FzfLua files<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>FzfLua live_grep<cr>", {})

-- Load default vimrc
vim.cmd([[
  set runtimepath^=~/.vim
  let &packpath = &runtimepath
  source ~/.vimrc
]])

-- local buf = "#" .. vim.api.nvim_win_get_buf(vim.g.statusline_winid)
-- local filename = (fn.expand(buf) == "" and "Empty") or fn.expand(buf .. ":t")
