return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim", --[[ "andrew-george/telescope-themes"  ]]
	},
	keys = { "<leader>f", "<leader>p" },
	config = function()
		require("config.telescope")
	end,
}
