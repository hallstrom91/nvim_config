return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-web-devicons' }, 
  config = function()
    require('lualine').setup {
      options = { theme = 'gruvbox' },  -- Anpassa efter ditt tema
    }
  end,
}

