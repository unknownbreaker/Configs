-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- -- never let LSP format
    -- opts.default_format_opts = { lsp_format = "never" }
    -- opts.format_on_save = function(bufnr)
    --   local path = (vim.api.nvim_buf_get_name(bufnr) or ""):lower()
    --   if path:find("fa_web", 1, true) then
    --     return { lsp_fallback = false, timeout_ms = 3000 }
    --   end
    --   return false -- disable elsewhere
    -- end
    -- opts.log_level = vim.log.levels.DEBUG
    --
    -- -- resolve prettier per-buffer (local -> Mason -> system)
    -- local function resolve_prettier(ctx)
    --   local local_bin = vim.fs.find("node_modules/.bin/prettier", {
    --     upward = true,
    --     path = ctx and ctx.dirname or vim.loop.cwd(),
    --     stop = vim.loop.os_homedir(),
    --     limit = 1,
    --   })[1]
    --   if local_bin and vim.fn.executable(local_bin) == 1 then
    --     return local_bin
    --   end
    --   local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/prettier"
    --   if vim.fn.executable(mason_bin) == 1 then
    --     return mason_bin
    --   end
    --   if vim.fn.executable("prettier") == 1 then
    --     return "prettier"
    --   end
    --   return nil
    -- end
    --
    -- opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
    --   prettier = {
    --     inherit = true,  -- <-- keep builtin filetypes/behaviors so it's never "unavailable"
    --     stdin = true,
    --     command = function(ctx)
    --       return resolve_prettier(ctx) or "prettier"
    --     end,
    --     args = { "--stdin-filepath", "$FILENAME" },
    --     prepend_args = function(_, ctx)
    --       local dir = (ctx.dirname or ""):lower()
    --       if dir:find("fa_web", 1, true) then
    --         return {
    --           "--use-tabs",
    --           "--tab-width", "4",
    --           "--config-precedence", "cli-override",
    --           "--no-editorconfig",
    --         }
    --       end
    --       return {}
    --     end,
    --   },
    -- })
    --
    -- ensure all relevant web fts are mapped to prettier
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
    })

    return opts
  end,
}

