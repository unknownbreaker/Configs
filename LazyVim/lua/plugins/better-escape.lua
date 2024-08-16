return {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mappings = {
          i = {
            [" "] = {
              ["<tab>"] = function()
                -- Defer execution to avoid side-effects
                vim.defer_fn(function()
                  -- set undo point
                  vim.o.ul = vim.o.ul
                  require("luasnip").expand_or_jump()
                end, 1)
              end,
            },
            j = {
              k = false,
              j = false,
            },
          },
          t = {
            j = {
              k = false,
              j = false,
            },
          },
        },
      })
    end,
  },
}
