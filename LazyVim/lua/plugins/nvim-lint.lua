return {
  -- nvim-lint
  {
    "mfussenegger/nvim-lint",
    ft = { "tcl", "rvt" },
    config = function()
      require("lint").linters_by_ft = {
        tcl = { "nagelfar" },
        rvt = { "nagelfar" }, -- For your Rivet files
      }

      -- Custom Nagelfar linter configuration
      require("lint").linters.nagelfar = {
        cmd = "nagelfar.tcl",
        stdin = false,
        args = {},
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          for line in output:gmatch("[^\r\n]+") do
            -- Parse Nagelfar output: "Line   5: W Found constant..."
            local line_num, severity, message = line:match("^Line%s+(%d+):%s+([NEW])%s+(.+)$")
            if line_num then
              local diagnostic_severity = severity == "E" and vim.diagnostic.severity.ERROR
                  or severity == "W" and vim.diagnostic.severity.WARN
                  or vim.diagnostic.severity.INFO

              table.insert(diagnostics, {
                lnum = tonumber(line_num) - 1,
                col = 0,
                message = message,
                severity = diagnostic_severity,
                source = "nagelfar",
              })
            end
          end
          return diagnostics
        end,
      }

      -- Auto-lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = { "*.tcl", "*.rvt" },
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
