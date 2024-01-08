return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
		opts = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
}

