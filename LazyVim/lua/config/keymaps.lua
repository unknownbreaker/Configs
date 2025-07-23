-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

wk.register({
  -- Harpoon keymaps
  ["<leader>h"] = {
    name = "+harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
    r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "remove file" },
    m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next file" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous file" },
    ["1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
    ["2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
    ["3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
  },

  -- Help
  ["<leader>H"] = {
    name = "+help/debug/conceal",
    c = {
      name = "conceal",
      h = { ":set conceallevel=1<cr>", "hide/conceal" },
      s = { ":set conceallevel=0<cr>", "show/unconceal" },
    },
    t = {
      name = "treesitter",
      t = { vim.treesitter.inspect_tree, "show tree" },
      c = { ":=vim.treesitter.get_captures_at_cursor()<cr>", "show capture" },
      n = { ":=vim.treesitter.get_node():type()<cr>", "show node" },
    },
  },
})

if vim.g.vscode then
  -- Always yank to system clipboard
  vim.keymap.set({ "n", "v" }, "y", '"+y')
  vim.keymap.set({ "n", "v" }, "p", '"+p')
  vim.keymap.set({ "n", "v" }, "P", '"+P')
end
