local custom_theme = require("lualine.themes.auto")

local colors = {
	bg = "#1E1E1E",
	fg = "#CCCCCC",
	bg_local = "#252526",
	visual_color = "#254F78",
	yellow = "#CCA700",
	cyan = "#00B7E4",
	darkblue = "#007ACC",
	green = "#487E02",
	orange = "#E37D30",
	violet = "#C586C0",
	magenta = "#D16D9E",
	blue = "#569CD6",
	red = "#F14C4C",
}

custom_theme.normal.a.bg = colors.darkblue
custom_theme.normal.a.fg = colors.fg

custom_theme.insert.a.bg = colors.green
custom_theme.insert.a.fg = colors.fg

custom_theme.visual.a.bg = colors.violet
custom_theme.visual.a.fg = colors.fg

custom_theme.replace.a.bg = colors.red
custom_theme.replace.a.fg = colors.fg

custom_theme.command.a.bg = colors.yellow
custom_theme.command.a.fg = colors.fg

custom_theme.normal.b.bg = colors.bg
custom_theme.normal.b.fg = colors.fg

custom_theme.normal.c.bg = colors.bg
custom_theme.normal.c.fg = colors.fg

-- icons for current mode
local mode_icons = {
	NORMAL = " ",
	INSERT = "󱓥 ",
	VISUAL = "󱘣 ",
	REPLACE = "󰛈 ",
	COMMAND = " ",
}

-- get the current mode
local function mode_with_icon()
	local current_mode = vim.fn.mode():sub(1, 1)
	local mode_map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		R = "REPLACE",
		c = "COMMAND",
	}
	local mode_name = mode_map[current_mode] or "NORMAL"
	return mode_icons[mode_name] .. mode_name
end

-- helper functions
local helper = {
	screen_width = function(min_w)
		return function()
			return vim.o.columns > min_w
		end
	end,
	buffer_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) == 120
	end,
}

-- function to display time
local function current_time()
	return os.date("%H:%M:%S") -- (24-hour format)
end

-- LSP diagnostics
local lsp_diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbol = { error = "  ", warn = " ", info = " ", hint = " " },
	cond = helper.screen_width(120),
	color = {
		error = colors.red,
		warn = colors.yellow,
		info = colors.blue,
		hint = colors.cyan,
	},
}

-- component to show lsp loading progress
local lsp_progress = {
	function()
		return require("lsp-progress").progress()
	end,
	color = {
		fg = colors.fg,
		bg = colors.bg,
	},
}

local nvim_logo = {
	function()
		return " neovim"
	end,
	cond = function()
		return vim.v.hlsearch == 0 and not vim.fn.mode():match("[vV]")
	end,
	color = {
		fg = colors.fg,
		bg = colors.bg,
		gui = "bold",
	},
}

require("lualine").setup({

	options = {
		theme = custom_theme,
		component_separators = "", -- no icons between components
		section_separators = { left = "", right = "" },
		--	section_separators = "|", -- no icons between sections
		--	component_separators = { left = "", right = "" },
		--	section_separators = { left = "", right = "" },
		always_divide_middle = true,
		disabled_filetypes = {
			statusline = { "neo-tree", "git", "fugitive", "trouble" },
			winbar = { "neo-tree", "DiffviewFiles", "git" },
		},
	},

	sections = {

		lualine_a = {
			{
				mode_with_icon,
				color = { bg = colors.darkblue, fg = colors.fg, gui = "bold" },
				padding = { left = 1, right = 1 },
			},
		},

		lualine_b = {
			{
				"branch",
				icon = " ",
				color = {
					fg = colors.fg,
					bg = colors.bg,
					gui = "bold",
				},
			},
			{
				"diff",
				symbols = {
					added = "✚ ",
					modified = "✎ ",
					removed = "✖ ",
					color_added = colors.green,
					color_modified = colors.orange,
					color_removed = colors.red,
				},
			},
		},

		lualine_c = {
			{
				"filename",
				file_status = true, -- show modified
				newfile_status = true,
				path = 0, -- 1 =  filename, 2: filename with path, 3: full path
				--[[ 		color = {
						fg = colors.fg,
						bg = colors.visual_color,
					}, ]]
				--	cond = helper.screen_width(120),
			},
		},

		lualine_x = {
			{ "selectioncount" },
			{ "searchcount" },
			nvim_logo,
		},

		lualine_y = { lsp_progress, lsp_diagnostics },

		lualine_z = {
			{
				current_time,
				icon = " ",
				color = {
					fg = colors.fg,
					bg = colors.darkblue,
					gui = "bold",
				},
			},
		},
	},

	inactive_sections = {
		-- to remove defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
})

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = "lualine_augroup",
	pattern = "LspProgressStatusUpdated",
	callback = require("lualine").refresh,
})
