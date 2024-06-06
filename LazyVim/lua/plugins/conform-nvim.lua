return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["css"] = { "prettier" },
        ["lua"] = { "stylua" },
        ["fish"] = { "fish_indent" },
        ["go"] = { "goimports", "gofumpt" },
        ["graphql"] = { "prettier" },
        ["html"] = { "prettier" },
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["json"] = { "prettier" },
        ["sh"] = { "shfmt" },
        ["sql"] = { "sql_formatter", "sqlfluff" },
        ["scss"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["yaml"] = { "prettier" },
      },
    },
  },
}
