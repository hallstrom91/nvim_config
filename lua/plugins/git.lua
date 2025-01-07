return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gstatus", "Gcommit", "Gpush", "Gpull" },
		config = function()
			vim.cmd([[
				nnoremap <leader>gs :Git status<CR>
				nnoremap <leader>gd :Git diff<CR>
			]])
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("config.gitsigns")
		end,
	},
}
