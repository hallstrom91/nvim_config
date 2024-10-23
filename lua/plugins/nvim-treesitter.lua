return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	event = { "BufRead", "BufNewFile" },

	config = function()
		require("config.nvim-treesitter")
	end,
}
