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
        "black", -- Python
        "isort", -- Python
        "fish_indent",
        "flake8",
        "goimports",
        "gofumpt",
        "jq",
        "prettierd",
        "shfmt",
        "sql-formatter",
        "stylua",

        -- Linters
        "shellcheck",
        "sqlfluff",

        -- LSPs
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "emmet-ls",
        -- "eslint-lsp",
        "gopls",
        "graphql-language-service-cli",
        "html-lsp",
        "json-lsp",
        "ruff-lsp", -- python
        "rust-analyzer",
        "sqlls",
        "tailwindcss-language-server",
        -- "typescript-language-server",
        "vue-language-server",
        "yaml-language-server",
      },
      automatic_installation = false,
      handlers = {},
    })
  end,
}
