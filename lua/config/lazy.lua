require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
	opts = {
		rocks = {
			enabled = false, -- disable luarocks (still gives error in checkhealth)
			hererocks = false, -- disable hererocks (still gives error in checkhealth)
		},
	},
})
