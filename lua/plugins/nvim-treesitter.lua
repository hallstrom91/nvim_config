return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("config.nvim-treesitter")
	end,
}
