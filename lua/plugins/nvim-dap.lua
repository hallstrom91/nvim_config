return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("config.nvim-dap")
		end,
	},
}
