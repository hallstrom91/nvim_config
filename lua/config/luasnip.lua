--require("luasnip.loaders.from_vscode").lazy_load()
-- require("vim-react-snippets").lazy_load()
local ls = require("luasnip")

ls.snippets = {
	-- custom lua snippets
	lua = {
		ls.parser.parse_snippet("fn", "function $1($2)\n  $0\nend"),
	},
	-- custom js snippets
	javascript = {
		-- For loop
		ls.parser.parse_snippet("for", "for (let ${1:i} = 0; ${1:i} < ${2:array.length}; ${1:i}++) {\n  $0\n}"),

		-- forEach loop
		ls.parser.parse_snippet("foreach", "${1:array}.forEach((${2:item}, ${3:index}) => {\n  $0\n});"),

		-- For...of loop
		ls.parser.parse_snippet("forof", "for (const ${1:item} of ${2:array}) {\n  $0\n}"),

		-- For...in loop
		ls.parser.parse_snippet(
			"forin",
			"for (const ${1:key} in ${2:object}) {\n  if (Object.hasOwnProperty.call(${2:object}, ${1:key})) {\n    $0\n  }\n}"
		),
	},

	-- reactjs

	-- custom reactjs snippets
}
