local colors = require('modules.colors').vsc_dark_modern
local neovim_logo = require('modules.colors').neovim_logo

vim.api.nvim_set_hl(0, 'NeovimDarkLeaf', { fg = neovim_logo.dark_leaf, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimLeaf', { fg = neovim_logo.leaf, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimDustyTeal', { fg = neovim_logo.dusty_teal, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimLightSky', { fg = neovim_logo.light_sky, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimSky', { fg = neovim_logo.sky, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimDarkSky', { fg = neovim_logo.dark_sky, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimIcon', { fg = neovim_logo.icon, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimText', { fg = neovim_logo.text, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimNumber', { fg = neovim_logo.number, bg = nil, bold = true })

status_components.clock = {
  function()
    return os.date('%H:%M:%S') -- (24-hour format)
  end,
  icon = ' ',
  color = {
    fg = colors.fg,
    bg = colors.darkblue,
    gui = 'bold',
  },
}

return status_components
