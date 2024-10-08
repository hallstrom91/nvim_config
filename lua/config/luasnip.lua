require("luasnip.loaders.from_vscode").lazy_load()
-- require("vim-react-snippets").lazy_load()
local ls = require("luasnip")
local s = ls.snippet -- define snippet
local i = ls.insert_node -- define text-node, static text
local t = ls.text_node -- insert-node for user values

ls.snippets = {
	-- custom lua snippets
	lua = {
		ls.parser.parse_snippet("fn", "function $1($2)\n  $0\nend"),
	},
	-- custom js snippets
	javascript = {
		-- For loop
		s("for", {
			t("for (let "),
			i(1, "i"),
			t(" = 0; "),
			i(2, "i"),
			t(" < "),
			i(3, "array.length"),
			t("; "),
			i(4, "i++"),
			t(") {"),
			t({ "", "  " }),
			i(0),
			t({ "", "}" }),
		}),

		-- forEach loop
		s("foreach", {
			i(1, "array"),
			t(".forEach(("),
			i(2, "item"),
			t(", "),
			i(3, "index"),
			t(") => {"),
			t({ "", "  " }),
			i(0),
			t({ "", "});" }),
		}),

		-- For...of loop
		s("forof", {
			t("for (const "),
			i(1, "item"),
			t(" of "),
			i(2, "array"),
			t(") {"),
			t({ "", "  " }),
			i(0),
			t({ "", "}" }),
		}),

		-- For...in loop
		s("forin", {
			t("for (const "),
			i(1, "key"),
			t(" in "),
			i(2, "object"),
			t(") {"),
			t({ "", "  if (Object.hasOwnProperty.call(" }),
			i(3, "object"),
			t(", "),
			i(1, "key"),
			t(")) {"),
			t({ "", "    " }),
			i(0),
			t({ "", "  }", "}" }),
		}),
	},

	-- reactjs

	-- custom reactjs snippets
}
