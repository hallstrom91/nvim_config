return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	-- @module 'render-markdown'
	-- @type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			latex = { enabled = false },
			heading = {
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				signs = { "󰜴 " },
				border = true,
				above = "▄",
				below = "▀",
			},
		})
	end,
}
