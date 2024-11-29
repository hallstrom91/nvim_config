return {
	"hinell/lsp-timeout.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		vim.g.lspTimeoutConfig = {
			stopTimeout = 1000 * 60 * 25, -- 25min until LSP shutdown for buffer
			startTimeout = 1000 * 5, -- 5s to restart LSP for buffer
			silent = false, -- Get notifications if deactivated / activated
			filetypes = {
				ignore = { "markdown", "plaintext" },
			},
		}

		-- Validera inställningen
		local Config = require("lsp-timeout.config").Config
		Config:new(vim.g.lspTimeoutConfig):validate()
	end,
}
