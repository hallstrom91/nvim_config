local mode_icons = {
	NORMAL = " ", -- Clipboard for Normal
	INSERT = "󱓥 ", -- Writing icon
	VISUAL = "󱘣 ", -- Visual icon
	REPLACE = "󰛈", -- Replacement arrows
	COMMAND = " ", -- Terminal icon for command mode
}

local function mode_with_icon()
	local current_mode = vim.fn.mode():sub(1, 1) -- get the current mode
	local mode_map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		R = "REPLACE",
		c = "COMMAND",
	}
	local mode_name = mode_map[current_mode] or "NORMAL"
	return mode_icons[mode_name] .. mode_name -- return icon + mode name
end

local function current_time()
	return os.date("%H:%M:%S") -- Format: Hour:Minute:Second (24-hour format)
end

require("lualine").setup({
	-- layout for sections (BOTTOM)
	sections = {
		-- current mode display (no.1 from left)
		lualine_a = {
			{
				mode_with_icon, -- use custom mode function
				padding = { left = 1, right = 3 },
			},
		},

		-- git info (no.2 from left)
		lualine_b = {
			{
				"branch",
				icon = "",
			},
			{
				"diff",
				color_added = "#00AD09",
				color_modified = "#E37D30",
				color_removed = "#9D0000",
				symbols = { added = "✚ ", modified = "✎ ", removed = "✖ " },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- show modified or not
				newfile_status = true,
				path = 0, -- 1 =  filename, 2: filename with path, 3: full path
			},
		},
		lualine_x = {
			"filetype", -- Filens typ
			{
				"location",
				padding = { left = 1, right = 2 },
			},
		},
		lualine_y = {
			{
				current_time,
				icon = " ",
			},
		},
		lualine_z = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },

				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = "DiagnosticError", -- Changes diagnostics' error color.
					warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
					info = "DiagnosticInfo", -- Changes diagnostics' info color.
					hint = "DiagnosticHint", -- Changes diagnostics' hint color.
				},
				symbols = { error = " E", warn = " W", info = " I", hint = "󰘥 H" },
				colored = false,
			},
		},
	}, -- End of section config

	options = {
		theme = "auto", -- Set theme (optional)
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		always_divide_middle = true,
		show_buffer_close_icons = true,
	},
})
