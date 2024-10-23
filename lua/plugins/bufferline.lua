return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufWinEnter",
	config = function()
		require("config.bufferline")
	end,
}
