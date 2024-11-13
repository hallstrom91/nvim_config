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
		bottom_search = true, -- false for optimal performance
		command_palette = true, -- false for optimal performance
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
})
