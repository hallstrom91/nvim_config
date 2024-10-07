require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" }, -- Formatter for Lua
		python = { "isort", "black" }, -- Formatters for Python
		javascript = {
			--		"prettierd",
			"prettier",
			stop_after_first = true,
		}, -- Format JavaScript/TypeScript with Prettier
		typescript = {
			--		"prettierd",
			"prettier",
			stop_after_first = true,
		},
		html = { "prettier" }, -- For HTML
		css = { "prettier" }, -- For CSS
	},
	format_on_save = {
		-- Set format-on-save behavior
		timeout_ms = 1000, -- 1000ms if bigger files
		lsp_format = "fallback",
	},
})
