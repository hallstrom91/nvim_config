return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "auto" }, -- Customize after current theme
		})
	end,
}
