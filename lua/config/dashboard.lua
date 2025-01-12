local api = vim.api
local map = vim.keymap.set
local dashboard = require('dashboard')

local function load_imgs(file)
  local success, header = pcall(require, 'themes.dash-headers.' .. file)
  if success then
    return header
  else
    return { 'Error loading ascii img files: ' .. file }
  end
end

local function open_link(link)
  vim.fn.jobstart({ 'xdg-open', link }, { detach = true }) -- For Linux
  -- vim.fn.jobstart({"open", link}, {detach = true}) -- For macOS
  -- vim.fn.jobstart({"start", link}, {detach = true}) -- For Windows
end

-- Load header ASCII image by filename
local selected_header = 'dash_neovim' -- or "dash_nvim"

local conf = {}

conf.header = load_imgs(selected_header)

conf.center = {

  {
    icon = '󰈞  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files',
    key = '<Leader> f f',
  },
  {
    icon = '󰈢  ',
    desc = 'Recently Opened Files                   ',
    action = 'Telescope oldfiles',
    key = '<Leader> f r',
  },
  {
    icon = '󰈬  ',
    desc = 'Project Grep                            ',
    action = 'Telescope live_grep',
    key = '<Leader> f g',
  },
  {
    icon = '  ',
    desc = 'Project Buffers                            ',
    action = 'Telescope buffers',
    key = '<Leader> f b',
  },
  {
    icon = '󰍜  ',
    desc = 'Open Neotree Menu                        ',
    action = 'Neotree toggle reveal_force_cwd=true',
    key = 'CTRL n',
  },
  {
    icon = '  ',
    desc = 'Display Keybinds                       ',
    action = 'WhichKey',
    key = 'spacebar',
  },
  {
    icon = '󰗼  ',
    desc = 'Quit Neovim                               ',
    action = 'qa',
    key = 'q',
  },
  {
    icon = '  ',
    action = function()
      open_link('https://github.com/hallstrom91/nvim_config')
    end,
    desc = 'https://github.com/hallstrom91/nvim_config',
  },
}

-- conf.footer = load_imgs(selected_footer)

dashboard.setup({
  theme = 'doom',
  shortcut_type = 'number',
  config = conf,
})

api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  group = api.nvim_create_augroup('dashboard_enter', { clear = true }),
  callback = function()
    map('n', 'q', ':qa<CR>', { buffer = true, silent = true })
    map('n', 'e', ':enew<CR>', { buffer = true, silent = true })
  end,
})

map('n', '<leader>db', ':Dashboard<CR>', { noremap = true, silent = true, desc = 'Open Dashboard' })
