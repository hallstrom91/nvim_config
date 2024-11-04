return {
	"kevinhwang91/nvim-ufo",
	requires = { "kevinhwang91/promise-async" },
	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua", "html", "css" },
	config = function()
		require("config.nvim-ufo")
	end,
}
