return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
    { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to reference" },
  },
}
