require("luasnip").config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.local/share/nvim/lazy/friendly-snippets/" })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
