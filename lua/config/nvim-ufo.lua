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
