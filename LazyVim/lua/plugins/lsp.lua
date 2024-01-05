return {

	-- Deno plugin
	{
		"sigmaSd/deno-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
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
