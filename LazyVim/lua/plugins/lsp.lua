return {

  -- Add more LSPs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        docker_compose_language_service = {},
        dockerls = {},
        emmet_ls = {},
        gopls = {},
        graphql = {},
        html = {},
        jsonls = {},
        ruff_lsp = {},
        rust_analyzer = {},
        sqlls = {},
        tailwindcss = {},
        tsserver = {},
        volar = {},
        yamlls = {},
      },
    },
  },

  -- Colors
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  -- Include color swatches in auto-complete menu
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "roobert/tailwindcss-colorizer-cmp.nvim", config = true
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

	-- Deno plugin
	{
		"sigmaSd/deno-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
	},

	-- Lua plugin
	{ "folke/neodev.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
  },

	-- TypeScript plugin
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
