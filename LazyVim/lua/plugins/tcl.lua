-- ~/.config/nvim/lua/plugins/tcl-simple.lua
return {
  -- Just TCL syntax highlighting
  {
    "vim-scripts/tcl.vim",
    ft = { "tcl", "rvt" },
  },

  -- RVT = TCL detection
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.rvt",
        callback = function()
          vim.bo.filetype = "tcl"
        end,
      })
    end,
  },

  -- Disable tree-sitter for TCL globally
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = { "tcl" },
      },
    },
  },
}
