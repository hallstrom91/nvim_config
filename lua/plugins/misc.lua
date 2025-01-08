return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("config.dashboard")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	{
		"folke/noice.nvim",
		--	event = "VeryLazy",
		event = { "BufReadPre", "BufNewFile" }, -- test
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					signature = {
						enabled = true,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = false,
					command_palette = false,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({})
		end,
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		cmd = { "Copen", "Cclose", "Cnext", "Cprevious", "Cgetexpr" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				auto_resize_height = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "│", "│", "─", "─", "╭", "╮", "╯", "╰" },
				},
				func_map = {
					open = "<CR>",
					drop = "o",
					tabdrop = "t",
					split = "<C-s>",
					vsplit = "<C-v>",
					stoggleup = "<C-k>",
					stoggledown = "<C-j>",
				},
			})
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua", "html", "css" },
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					local enabled_filetypes =
						{ "javascript", "javascriptreact", "typescript", "typescriptreact", "lua", "html", "css" }
					for _, ft in ipairs(enabled_filetypes) do
						if ft == filetype then
							return { "treesitter", "indent" }
						end
					end

					return nil
				end,
			})

			vim.keymap.set("n", "zR", function()
				require("ufo").openAllFolds()
			end)

			vim.keymap.set("n", "zM", function()
				require("ufo").closeAllFolds()
			end)

			vim.keymap.set("n", "zr", function()
				require("ufo").openFoldsExceptKinds()
			end)

			vim.keymap.set("n", "zm", function()
				require("ufo").closeFoldsWith()
			end)

			vim.keymap.set("n", "zp", function()
				require("ufo").peekFoldedLinesUnder()
			end)
		end,
	},
}
