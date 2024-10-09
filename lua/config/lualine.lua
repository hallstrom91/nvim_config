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
				color_added = "#00AD09", -- Green for added
				color_modified = "#E37D30", -- orange for modified
				color_removed = "#9D0000", -- red for deleted
				symbols = { added = "✚ ", modified = "✎ ", removed = "✖ " },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- Visar om filen är modifierad eller ej
				newfile_status = true, -- Visar om filen är ny
				path = 1, -- 1: bara filnamn, 2: filnamn med sökväg, 3: full sökväg
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
				"encoding",
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
				symbols = { error = "E", warn = "W", info = "I", hint = "H" },
				colored = false,
			},
		},
	}, -- End of section config

	-- layout for tabline (TOP)
	tabline = {
		lualine_a = {
			{
				"hostname",
			},
		},
		lualine_b = {
			{

				"buffers",
				mode = 0,
				show_filename_only = true, -- Endast visa filnamnet, utan full sökväg
				show_modified_status = false, -- Visa om filen är modifierad
				icons_enabled = true,
				padding = { left = 1, right = 2 },
				symbols = {
					modified = "󰮍 ",
					alternate_file = "󱪔 ",
					directory = " ",
				},
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				current_time,
				icon = " ",
			},
		},
	},

	options = {
		theme = "auto", -- Set theme (optional)
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		always_divide_middle = true,
	},
})
