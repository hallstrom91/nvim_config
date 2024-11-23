require("bufferline").setup({
	options = {
		mode = "buffers", -- show buffers instead of tabs
		style_preset = require("bufferline").style_preset.default, -- or use minimal
		themable = true, -- allow highlight overrides
		numbers = "ordinal", -- show buffer numbers (can be "none", "ordinal", "buffer_id", or "both")
		diagnostics = "nvim_lsp", -- show diagnostics in buffer tab
		close_command = "bdelete! %d", -- close buffer with bdelete
		right_mouse_command = "bdelete! %d", -- close buffer with right-click
		left_mouse_command = "buffer %d", -- switch to buffer with left-click
		middle_mouse_command = nil, -- no action on middle-click

		-- Indicator for the active buffer
		indicator = {
			icon = "▎󰸞 ", -- indicator for active buffer
			style = "icon", -- can be 'icon', 'underline', or 'none'
		},

		-- Icons for closing and modified buffers
		buffer_close_icon = "󰅖", -- icon for closing buffers
		modified_icon = "●", -- icon for modified buffers
		close_icon = "", -- icon for completely closing the bufferline (when relevant)
		left_trunc_marker = "", -- icon to indicate more buffers to the left
		right_trunc_marker = "", -- icon to indicate more buffers to the right

		-- Other options
		show_buffer_close_icons = true, -- show close icon on each buffer
		show_tab_indicators = true, -- show indicators for active tabs
		persist_buffer_sort = true, -- maintain buffer sorting between sessions
		separator_style = "thick", -- options: "slant", "thick", "thin", etc.
		enforce_regular_tabs = false, -- prevent irregular tabs
		always_show_bufferline = true, -- always show bufferline even with one buffer open
	},
})

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
