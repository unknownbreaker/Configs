return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["css"] = { "prettierd" },
        ["lua"] = { "stylua" },
        ["fish"] = { "fish_indent" },
        ["go"] = { "goimports", "gofumpt" },
        ["graphql"] = { "prettierd" },
        ["html"] = { "prettierd" },
        ["javascript"] = { "prettierd" },
        ["javascriptreact"] = { "prettierd" },
        ["json"] = { "jq" },
        ["sh"] = { "shfmt" },
        ["sql"] = { "sql_formatter", "sqlfluff" },
        ["scss"] = { "prettierd" },
        ["typescript"] = { "prettierd" },
        ["typescriptreact"] = { "prettierd" },
        ["vue"] = { "prettierd" },
      },
    },
  },
}
