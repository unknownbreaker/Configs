return {
  {
    "unknownbreaker/tcl-lsp.nvim",
    ft = "tcl",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("tcl-lsp").setup() -- Loads lua/tcl-lsp/init.lua
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Disable treesitter for TCL files if it's causing issues
      opts.highlight = opts.highlight or {}
      opts.highlight.disable = opts.highlight.disable or {}
      table.insert(opts.highlight.disable, "tcl")
    end,
  },
}
