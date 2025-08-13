-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  -- Always yank to system clipboard
  vim.keymap.set({ "n", "v" }, "y", '"+y')
  vim.keymap.set({ "n", "v" }, "p", '"+p')
  vim.keymap.set({ "n", "v" }, "P", '"+P')

  vim.keymap.set(
    "n",
    "<leader>gr",
    [[<cmd>lua require('vscode').action('editor.action.goToReference')<cr>]],
    { desc = "Go to reference" }
  )
else
  local wk = require("which-key")
end
