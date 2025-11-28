return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "css",
        "dockerfile",
        "html",
        "lua",
        "make",
        "nix",
        "perl",
        "query",
        "regex",
        "scss",
        -- "tcl",
        "tsx",
        "vim",
        "xml",
      })
    end,
  },
}
