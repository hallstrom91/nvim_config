return {
	"numToStr/Comment.nvim",
	keys = { "gcc", "gc", "gb" }, -- 'gcc' för att kommentera en rad, 'gc' för block, 'gb' för blockkommentarer
	config = function()
		require("Comment").setup()
	end,
}
