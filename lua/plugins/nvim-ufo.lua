return {
	"kevinhwang91/nvim-ufo",
	requires = { "kevinhwang91/promise-async" },
	config = function()
		-- Setup för UFO med LSP
		require("config.nvim-ufo")
	end,
}
