return {

	-- Deno plugin
	{
		"sigmaSd/deno-nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
		},
	},

	-- Lua plugin
	{ "folke/neodev.nvim", opts = {} },

	-- TypeScript plugin
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
