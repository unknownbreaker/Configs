return {
  -- nvim-lint
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "nat-418/tcl.nvim",
    },
    opts = {
      linters_by_ft = {
        go = { "golangcit_lint" },
        -- javascript = { "eslint_d" },
        -- javascriptreact = { "eslint_d" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
        tcl = { "tcl" },
        -- typescript = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },
        -- vue = { "eslint_d" },
      },
    },
  },
}
