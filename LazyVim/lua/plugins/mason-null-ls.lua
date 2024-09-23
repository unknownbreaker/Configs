return {
  {
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
          "goimports", -- Go
          "gofumpt", -- Go
          "jq", -- JSON
          "prettier",
          "shfmt",
          "sql-formatter",
          "stylua",

          -- Linters
          "cmakelang", -- CMake
          "cmakelint", -- CMake
          "erb-lint", -- Ruby
          "flake8", -- Python
          "hadolint", -- Docker
          "markdownlint", -- Markdown
          "phpcs", -- PHP
          "shellcheck", -- Bash
          "sqlfluff", -- SQL

          -- LSPs
          "angular-language-server",
          "css-lsp",
          "docker-compose-language-service",
          "dockerfile-language-server",
          "emmet-ls",
          "gitlab-ci-ls",
          "gopls",
          "graphql-language-service-cli",
          "helm-ls",
          "html-lsp",
          "json-lsp",
          "marksman",
          "neocmakelsp",
          "phpactor",
          "pyright",
          "rubocop",
          "rust-analyzer",
          "sqlls",
          "tailwindcss-language-server",
          "vtsls",
          "vue-language-server",
          "yaml-language-server",
        },
        automatic_installation = false,
        handlers = {},
      })
    end,
  },
}
