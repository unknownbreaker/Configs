return {
  "ojroques/nvim-osc52",
  opts = {},
  config = function(_, opts)
    local osc52 = require("osc52")
    osc52.setup(opts)

    -- Send OSC52 for normal yanks
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == "y" then
          osc52.copy_register(vim.v.event.regname == "" and '"' or vim.v.event.regname)
        end
      end,
    })

    -- Make + and * use OSC52 explicitly
    vim.g.clipboard = {
      name = "osc52",
      copy = { ["+"] = osc52.copy, ["*"] = osc52.copy },
      paste = { ["+"] = osc52.paste, ["*"] = osc52.paste },
    }

    -- Use the system clipboard register by default
    vim.opt.clipboard = "unnamedplus"
  end,
}
