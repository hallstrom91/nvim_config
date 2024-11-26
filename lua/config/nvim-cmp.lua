local cmp = require("cmp")
local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter
local lspkind = require("lspkind")

local source_mapping = {
	nvim_lsp = "[LSP]",
	nvim_lua = "[LUA]",
	luasnip = "[SNIP]",
	buffer = "[BUF]",
	path = "[PATH]",
	treesitter = "[TREE]",
	--	["vim-dadbod-completion"] = "[DB]",
}

cmp.setup({
snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- LuaSnip
		end,
	},
    formatting = {
		format = function(entry, vim_item)
			-- tailwind formatter
			vim_item = tailwind_formatter(entry, vim_item)

			-- show icons from lspkind
			vim_item = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
			})(entry, vim_item)

			vim_item.abbr = vim_item.abbr:gsub("%$%d", "") -- test to remove () from imports

			vim_item.menu = source_mapping[entry.source.name] or ""
			return vim_item
		end,
	},
	performance = {
		max_view_entries = 15, -- show max 15 suggestions in CMP list
	},
	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		},
	},

	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),

		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				require("luasnip").jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{
			name = "dotenv",
			option = {
				path = ".",
				load_shell = false,
				item_kind = cmp.lsp.CompletionItemKind.Variable,
				eval_on_confirm = false,
				show_documentation = true,
				show_content_on_docs = true,
				documentation_kind = "markdown",
				dotenv_environment = "^%.env.*$", -- all env-files in project
				file_priority = function(a, b)
					return a:upper() < b:upper()
				end,
			},
		},
	}),
	completion = {
		autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged }, -- Trigger only after typing
		completeopt = "menu,menuone,noinsert", -- No preselection of first item
	},
})

-- for ":" (cmdline)
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- For `/` (search)
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

vim.cmd([[
highlight Pmenu guibg=#2E3440 guifg=#D8DEE9
highlight PmenuSel guibg=#4C566A guifg=#D8DEE9
highlight PmenuSbar guibg=#3B4252
highlight PmenuThumb guibg=#4C566A
]])
