return {
	"NvChad/nvim-colorizer.lua",
	ft = { "css", "scss", "html", "javascript", "typescript" },
	config = function()
		require("colorizer").setup({

			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = true,
				css = true,
				css_fn = true,
				mode = "background",
				tailwind = true, -- Tailwind activated
				always_update = true,
				virtualtext = "■",
			},
		})
	end,
}
