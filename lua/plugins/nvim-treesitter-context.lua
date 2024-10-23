return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = "nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("treesitter-context").setup({})
	end,
}
