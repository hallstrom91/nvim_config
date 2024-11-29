return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	ft = { "html", "javascript", "typescript", "css" },
	config = function()
		require("tailwindcss-colorizer-cmp").setup({
			color_square_width = 2,
		})
	end,
}
