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
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
        tcl = { "tcl" },
      },
    },
  },
}
