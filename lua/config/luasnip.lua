require("luasnip.loaders.from_vscode").lazy_load()
-- require("vim-react-snippets").lazy_load()
local ls = require("luasnip")

ls.snippets = {
	lua = {
		ls.parser.parse_snippet("fn", "function $1($2)\n  $0\nend"),
	},
}
