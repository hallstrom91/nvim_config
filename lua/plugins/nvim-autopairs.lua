return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- Load at insert mode
  config = function()
    require("nvim-autopairs").setup({})
  end,
}
