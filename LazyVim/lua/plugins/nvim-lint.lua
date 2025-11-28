return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      tcl = { "nagelfar" },
      rvt = { "nagelfar" },
    },
  },
}
