return {
  "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
config = function()
    require("config.nvim-treesitter")
end
}
