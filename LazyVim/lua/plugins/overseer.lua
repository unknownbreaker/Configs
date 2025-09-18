-- ~/.config/nvim/lua/plugins/overseer.lua
return {
  {
    "stevearc/overseer.nvim",
    optional = true,
    opts = function(_, opts)
      opts = opts or {}
      -- Append our template provider without removing defaults
      opts.templates = vim.list_extend(opts.templates or {}, {
        "nx",
      })

      -- (Optional) UI tweaks that merge rather than overwrite:
      opts.task_list = vim.tbl_deep_extend("force", opts.task_list or {}, {
        direction = "bottom",
        min_height = 8,
        max_height = 20,
      })

      return opts
    end,
    keys = function(_, keys)
      keys = keys or {}
      table.insert(keys, { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer Run" })
      table.insert(keys, { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Overseer Toggle" })
      return keys
    end,
  },
}
