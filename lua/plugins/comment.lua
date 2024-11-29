return {
	"numToStr/Comment.nvim",
	lazy = true, -- Gör Comment.nvim lazy-laddad
	keys = {
		{ "gc", mode = { "n", "v" }, desc = "Toggle comment (line)" },
		{ "gb", mode = { "n", "v" }, desc = "Toggle comment (block)" },
	},
	config = function()
		require("Comment").setup({
			toggler = {
				line = "gcc", -- comment for one row
				block = "gbb", -- block comment for marked rows
			},
			opleader = {
				line = "gc", -- comment on or several rows
				block = "gb", -- block comment for marked rows
			},
		})
	end,
}
