return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        -- Formatters
        "isort", -- Python
        "fish_indent",
        "flake8",
        "goimports",
        "gofumpt",
        "jq",
        "shfmt",
        "sql-formatter",
        "stylua",

        -- Linters
        "shellcheck",
        "sqlfluff",

        -- LSPs
        "css-lsp",
        "emmet-ls",
        "graphql-language-service-cli",
        "html-lsp",
      },
      automatic_installation = false,
      handlers = {},
    })
  end,
}
