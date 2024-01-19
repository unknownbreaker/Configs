return {
  -- navigate between neovim and tmux panes
  {
    'alexghergh/nvim-tmux-navigation',
    opts = {
      disable_when_zoomed = true,
    },
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Move left Tmux pane" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Move down Tmux pane" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Move up Tmux pane" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Move right Tmux pane" },
    },
  },
}

