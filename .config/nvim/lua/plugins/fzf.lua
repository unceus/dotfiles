return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local config = fzf.config
    config.defaults.keymap.builtin["<c-q>"] = "select-all+accept"
    config.defaults.keymap.builtin["enter"] = "select-all+accept" --doesn't work
  end,
  keys = {
    -- disable default file find keymap
    { "<leader><space>", false },
  },
}
