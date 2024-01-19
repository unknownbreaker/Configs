return {
    -- nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcit_lint" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
      },
    },
  },
}
