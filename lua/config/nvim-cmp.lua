local cmp = require("cmp")
local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- LuaSnip
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Först använd tailwind formatter
			vim_item = tailwind_formatter(entry, vim_item)
			-- Sen lägg till ikoner från lspkind
			vim_item = lspkind.cmp_format({
				mode = "symbol_text", -- visa både ikon och text
				maxwidth = 50, -- maxbredd för popup
				ellipsis_char = "...", -- vad som visas om det blir för långt
			})(entry, vim_item)
			return vim_item
		end,
	},
	-- old formatter tailwindcss colors
	-- formatting = {
	--   format = require("tailwindcss-colorizer-cmp").formatter, -- Tailwind CSS formatter
	-- },
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
		{ name = "nvim_lsp" }, -- Koppling till LSP
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	}),
})
