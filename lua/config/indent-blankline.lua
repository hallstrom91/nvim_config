local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#D08770" }) -- not red, terracotta
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E0AF68" }) -- not yellow, more brown
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#569CD6" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#B5CEA8" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#4EC9B0" })
end)

require("ibl").setup({
	indent = { highlight = highlight, char = "󰇙" },
	scope = { highlight = highlight, enabled = true, char = "" },
})

-- indent char = "" or "" or "󰇙"
-- scope char = "" or "󰞷" or "󰇘"
