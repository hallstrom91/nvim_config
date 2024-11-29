return {
	"kevinhwang91/nvim-ufo",
	requires = { "kevinhwang91/promise-async" },
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

		-- Keybindings for nvim-ufo
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
}
