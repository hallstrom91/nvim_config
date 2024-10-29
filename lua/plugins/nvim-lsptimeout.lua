return {
	"hinell/lsp-timeout.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		vim.g.lspTimeoutConfig = {
			stopTimeout = 1000 * 10 * 2, -- 2min until LSP shutdown for buffer
			startTimeout = 1000 * 5, -- 10s to restart LSP for buffer
			silent = false, -- Get notifications if deactivated / activated
			filetypes = {
				ignore = { "markdown", "plaintext" }, -- Lägg till filtyper där LSP-timeout ska ignoreras
			},
		}

		-- Validera inställningen
		local Config = require("lsp-timeout.config").Config
		Config:new(vim.g.lspTimeoutConfig):validate()
	end,
}
