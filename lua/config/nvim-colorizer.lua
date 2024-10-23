require("colorizer").setup({
	-- Specific filetypes for which colorizer will be active
	--	filetypes = {
	--		"html",
	--		"javascript",
	--		"javascriptreact",
	--		"typescript",
	--		"typescriptreact",
	--		"css",
	--		"scss",
	--		"sass",
	--		"json",
	--		"vue",
	--		"markdown",
	--	},
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
