return {

	-- Comment string context
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
		opts = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		-- keys = {
		--   { "<leader>ha", "<cmd>require('harpoon.mark').add_file()<cr>", "Mark file with Harpoon", },
		--   { "<leader>hm", "<cmd>require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Harpoon menu", },
		--   { "<C-j>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Go to next Harpoon mark", },
		--   { "<C-k>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Go to previous Harpoon mark", },
		--   { "<C-7>", "<cmd>require('harpoon.ui').nav_file(1)<cr>", "Jump to Harpoon mark 1", },
		--   { "<C-8>", "<cmd>require('harpoon.ui').nav_file(2)<cr>", "Jump to Harpoon mark 2", },
		--   { "<C-9>", "<cmd>require('harpoon.ui').nav_file(3)<cr>", "Jump to Harpoon mark 3", },
		--   { "<C-0>", "<cmd>require('harpoon.ui').nav_file(4)<cr>", "Jump to Harpoon mark 4", },
		-- },
	},
}
