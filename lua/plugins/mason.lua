return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate", -- test (update every time)
	config = function()
		require("config.mason")
	end,
}
