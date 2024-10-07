return {
	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip", -- Snippets
		"saadparwaiz1/cmp_luasnip", -- CMP integration
		--	"mlaursen/vim-react-snippets", -- React, Redux, TS only?
	},
	config = function()
		require("config.nvim-cmp") -- load config
	end,
}
