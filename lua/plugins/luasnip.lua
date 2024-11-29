return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	event = { "InsertEnter" },
	config = function()
		local luasnip = require("luasnip")

		luasnip.config.set_config({
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
		})

		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.local/share/nvim/lazy/friendly-snippets/" })
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
	end,
}
