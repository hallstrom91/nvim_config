return {
	"numToStr/Comment.nvim",
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
