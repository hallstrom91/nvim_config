return {
	"askfiy/visual_studio_code",
	priority = 100,
	config = function()
		vim.cmd([[colorscheme visual_studio_code]])
		require("visual_studio_code").setup({
			-- `dark` or `light`
			mode = "dark",
			-- Whether to load all color schemes
			preset = true,
			-- Whether to enable background transparency
			transparent = true,
			-- Whether to apply the adapted plugin
			expands = {
				hop = false,
				dbui = false,
				lazy = true,
				aerial = false,
				null_ls = false,
				nvim_cmp = true,
				gitsigns = true,
				which_key = true,
				nvim_tree = false,
				lspconfig = true,
				telescope = true,
				bufferline = true,
				nvim_navic = false,
				nvim_notify = true,
				vim_illuminate = false,
				nvim_treesitter = true,
				nvim_ts_rainbow = false,
				nvim_scrollview = false,
				nvim_ts_rainbow2 = false,
				indent_blankline = true,
				vim_visual_multi = false,
			},
			hooks = {
				before = function(conf, colors, utils) end,
				after = function(conf, colors, utils) end,
			},
		})
	end,
}
