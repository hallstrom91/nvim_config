return {
	"kevinhwang91/nvim-ufo",
	requires = { "kevinhwang91/promise-async" },
	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua", "html", "css" },
	config = function()
		-- Setup för UFO med LSP
		require("config.nvim-ufo")
	end,
}
