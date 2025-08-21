return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      prettier = {
        command = vim.fn.filereadable("./node_modules/.bin/prettier") == 1 and "./node_modules/.bin/prettier"
          or "prettier", -- this "prettier" will resolve to Mason's
      },
    },
  },
}
