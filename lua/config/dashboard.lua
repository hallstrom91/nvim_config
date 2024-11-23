local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")
local actual_startuptime = nil

local function load_imgs(file)
	local success, header = pcall(require, "themes.dash-headers." .. file)
	if success then
		return header
	else
		return { "Error loading ascii img files: " .. file }
	end
end

-- Load header ASCII image by filename
local selected_header = "dash_nvim"
-- local selected_footer = "dash_simon"

local conf = {}

conf.header = load_imgs(selected_header)

conf.center = {

	{
		icon = "󰈞  ",
		desc = "Find  File                              ",
		action = "Telescope find_files",
		key = "<Leader> f f",
	},
	{
		icon = "󰈢  ",
		desc = "Recently opened files                   ",
		action = "Telescope oldfiles",
		key = "<Leader> f r",
	},
	{
		icon = "󰈬  ",
		desc = "Project grep                            ",
		action = "Telescope live_grep",
		key = "<Leader> f g",
	},
	{
		icon = "  ",
		desc = "Project Buffers                            ",
		action = "Telescope buffers",
		key = "<Leader> f b",
	},
	{
		icon = "󰍜  ",
		desc = "Open NeoTree Menu                        ",
		key = "CTRL n",
	},
	{
		icon = "󰗼  ",
		desc = "Quit Nvim                               ",
		action = "qa",
		key = "q",
	},
	{
		icon = "  ",
		desc = "https://github.com/hallstrom91/nvim_config",
	},
}
-- conf.footer = load_imgs(selected_footer)

dashboard.setup({
	theme = "doom",
	shortcut_type = "number",
	config = conf,
})

api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
	callback = function()
		keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
		keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
	end,
})
