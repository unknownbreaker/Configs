return {
  -- nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcit_lint" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
        rvt = { "nagelfar" },
        tcl = { "nagelfar" },
      },
    },
  },
}
