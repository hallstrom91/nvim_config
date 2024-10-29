require("noice").setup({
	lsp = {
		signature = {
			enabled = true,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = false,
			["vim.lsp.util.stylize_markdown"] = false,
			["cmp.entry.get_documentation"] = false,
		},
	},
	presets = {
		bottom_search = false, -- true, testing false for opt
		command_palette = false, -- same
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})
