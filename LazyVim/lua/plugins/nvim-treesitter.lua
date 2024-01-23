return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"bash",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"nix",
				"perl",
				"php",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"sql",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"xml",
				"yaml",
			})
		end,
	},

}
