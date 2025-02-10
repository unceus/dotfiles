-- Add any additional keymaps here
-- Some nvim-only keybinds

vim.api.nvim_set_keymap("n", "<Leader>ov", ":sp ~/.config/nvim/init.lua<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>oo", ":sp ~/.config/nvim/lua/config/options.lua<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ok", ":sp ~/.config/nvim/lua/config/keymaps.lua<cr>", { silent = true })

vim.api.nvim_set_keymap("n", "<Leader>sv", ":source ~/.config/nvim/init.lua<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>so", ":source ~/.config/nvim/lua/config/options.lua<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sk", ":source ~/.config/nvim/lua/config/keymaps.lua<cr>", { silent = true })

vim.api.nvim_set_keymap("n", "<Leader>or", ":sp ~/README.md<cr>", { silent = true })

vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabnext<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tc", ":tabclose<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>to", ":tabnew<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tx", ":tabclose<cr>", { silent = true })

vim.api.nvim_set_keymap("n", "<Leader>w", ":w<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>ww", ":w<cr>", {})

vim.api.nvim_set_keymap("n", "<C-J>", "<C-W>j<C-W>_", { silent = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W>k<C-W>_", { silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h<C-W><bar>_", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l<C-W><bar>_", { silent = true })

-- disable default fzf keybind
vim.api.nvim_set_keymap("n", "<Leader><space>", ":noh<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>FzfLua files<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>FzfLua live_grep<cr>", {})
