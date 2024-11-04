local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("jsconfig-node", {
		t({
			"{",
			'  "compilerOptions": {',
			'    "module": "',
		}),
		i(1, "commonjs"),
		t('",'),
		t({ "", '    "target": "' }),
		i(2, "ESNext"),
		t('",'),
		t({ "", '    "checkJs": ' }),
		i(3, "false"),
		t({ "", "  }," }),
		t({ "", '  "exclude": [', '    "' }),
		i(4, "node_modules"),
		t({ '"', "  ]", "}" }),
	}),

	s("jsconfig-react", {
		t({
			"{",
			'  "compilerOptions": {',
			'    "module": "',
		}),
		i(1, "module"),
		t('",'),
		t({ "", '    "target": "' }),
		i(2, "ESNext"),
		t('",'),
		t({ "", '    "checkJs": ' }),
		i(3, "false"),
		t({ "", "  }," }),
		t({ "", '  "exclude": [', '    "' }),
		i(4, "node_modules"),
		t({ '"', "  ]", "}" }),
	}),

	s("tsconfig-react", { -- fix this
		t({
			"{",
			'  "compilerOptions": {',
			'    "module": "',
		}),
		i(1, "module"),
		t('",'),
		t({ "", '    "target": "' }),
		i(2, "ESNext"),
		t('",'),
		t({ "", '    "checkJs": ' }),
		i(3, "false"),
		t({ "", "  }," }),
		t({ "", '  "exclude": [', '    "' }),
		i(4, "node_modules"),
		t({ '"', "  ]", "}" }),
	}),
}
