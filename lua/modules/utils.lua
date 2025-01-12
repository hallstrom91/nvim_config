-- helper functions
local colors = require('modules.colors').vsc_dark_modern
local utils = {}

utils.screen_width_min = {
  function(min_w)
    return function()
      return vim.o.columns > min_w
    end
  end,
}

utils.buffer_empty = {
  function()
    return vim.fn.empty(vim.fn.expand('%:t')) == 120
  end,
}

utils.left_separator_lualine = function(color_fg)
  return {
    function()
      return ''
      --	return ""
    end,
    color = { fg = color_fg },
    padding = { left = 0, right = 0 },
  }
end

utils.right_separator_lualine = function(color_fg)
  return {
    function()
      return ''
      --	return ""
    end,
    color = { fg = color_fg },
    padding = { left = 0, right = 0 },
  }
end

return utils
