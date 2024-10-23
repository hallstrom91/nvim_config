return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufWritePre", "BufWritePost" },
	config = function()
		require("config.conform")
	end,
}
