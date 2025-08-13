return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Formatters
        "black", -- Python
        "isort", -- Python
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
        -- "hadolint", -- Docker
        "phpcs", -- PHP
        "shellcheck", -- Bash
        "sqlfluff", -- SQL

        -- LSPs
        -- "angular-language-server",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "emmet-ls",
        -- "gitlab-ci-ls",
        "golangci-lint-langserver",
        "graphql-language-service-cli",
        -- "helm-ls",
        "html-lsp",
        -- "json-lsp",
        -- "marksman",
        -- "neocmakelsp",
        -- "phpactor",
        -- "pyright",
        "rubocop",
        -- "rust-analyzer",
        -- "sqlls",
        -- "tailwindcss-language-server",
        "tilt",
        -- "vtsls",
        -- "vue-language-server",
        -- "yaml-language-server",
      },
    },
  },
}
