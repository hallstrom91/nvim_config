return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufWritePre", "BufWritePost" },
	config = function()
		require("conform").setup({

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		})
	end,
}
