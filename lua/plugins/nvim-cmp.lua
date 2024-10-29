return {
	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		"SergioRibera/cmp-dotenv",
	},
	config = function()
		require("config.nvim-cmp")
	end,
}
