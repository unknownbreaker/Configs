return {
    -- none-ls.nvim
  {
    "nvimtools/none-ls.nvim",
    -- opts = function(_, opts)
    --   local null_ls = require("null-ls")
    --   opts.sources = vim.list_extend(opts.sources, {
    --     -- Formatters
    --     null_ls.builtins.formatting.fish_indent,
    --     null_ls.builtins.formatting.gofumpt,
    --     null_ls.builtins.formatting.goimports,
    --     null_ls.builtins.formatting.prettierd,
    --     null_ls.builtins.formatters.shfmt,
    --     null_ls.builtins.formatters.sql_formatter,
    --     null_ls.builtins.formatting.stylua,
    --
    --     -- Linters
    --     null_ls.builtins.code_actions.eslint_d,
    --     null_ls.builtins.diagnostics.golangcit_lint,
    --     null_ls.builtins.diagnostics.shellcheck,
    --     null_ls.builtins.diagnostics.sqlfluff.with({
    --       extra_args = { "--dialect", "postgres" },
    --     }),
    --   })
    -- end,
  },
}
